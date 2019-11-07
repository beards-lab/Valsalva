# text = re.sub(r'', r'', text)
import re
import datetime
import fun_lib
import sys
# TODO
# map parameters
# map connections within class
# error output other connections?
# TODO - decide for each imported file, if it should be instantiated (as BG_modules) or included (as e.g. parameters)

print("Lets GO!")
# We have generally three types of mappings 
# 1] the instance parameter mapping, which assign values to the newly created isntance (by encapsulation) 
# 2] the outer parameter mapping, where the parameters of the object (usually imported as an separate file) are used to set the value of the component
# 3] inter-component mappings or connections, where the values are connected together. This shall be overcome using the conectors in the future



#Lets get all the parameters first
pckg, bgs = fun_lib.readCellMlFile('Parameters.cellml')

paramtext = fun_lib.convertText(bgs, pckg)
param_set = re.findall(r'parameter Real ([a-zA-Z0-9_]+).+[ ]*=[ ]*([-0-9.]+)', paramtext)


# we expect filename as "XXX_cellml.txt"
pckg, text = fun_lib.readCellMlFile('BG_Modules.cellml')
text = fun_lib.trimComments(text)
# write eqs
textWithEqs = fun_lib.fillEquationString(text)
# convert the rest
convertedText_modules = fun_lib.convertText(textWithEqs, pckg)



pckg, text = fun_lib.readCellMlFile('main_ADAN-86-Heart.cellml')
text = fun_lib.trimComments(text)
# write eqs
textWithEqs = fun_lib.fillEquationString(text)
# convert the rest
convertedText_main = fun_lib.convertText(textWithEqs, pckg)

# look for the encapsulations, e.g.:
# def group as encapsulation for
#     comp Systemic incl
#         comp Parameters_Systemic;
#         comp ascending_aorta_A_module;
# ...
 
encs = re.findall(r'def group as encapsulation for(.+?)enddef;', text, re.DOTALL)
# get rid of the text
convertedText_main = re.sub(r'def group as encapsulation for(.+?)enddef;', r"// encapsulation trimmed \n", convertedText_main, re.DOTALL)
convertedText_main = re.sub(r'def import using (.+?)enddef;', r"// import trimmed \n" , convertedText_main, re.DOTALL)

# build instances and populate them with parameters
for enc in encs:
    # find all the parent components within the encapsulation
    parents = re.findall(r'comp ([a-zA-Z0-9_]+) incl(.+?)endcomp;', enc, re.DOTALL)
    for par in parents:
        parent_name = par[0]
        print("Found encapsulation with parent " + parent_name)
        # find the encapsulated childs within the parents
        comps = re.findall(r'comp ([a-zA-Z0-9_]+)', par[1])
        instances = list()
        for instance_name in comps:
            # match in the imports, get the package name (the filename) and the object name, given we already know the instance name
            imports = re.findall(r'def import using "([a-zA-Z0-9_\.]+)" for(.*?) enddef;', text, re.DOTALL)
            for imprt in imports:
                import_lines = re.findall(r"comp " + instance_name + " using comp ([a-zA-Z0-9_.]+)", imprt[1])
                for object_name in import_lines:
                    package_name = re.sub(r'[\.\-]', r'_', imprt[0])
                    print('> building instance ' + instance_name)

                    # 1st type of mapping
                    # look for isntance parameters somehow?
                        # find in main text:
                        # def map between Parameters_Systemic and __instance__ for
                        #     vars __paramName__ and __param_inst__;
                        #     vars E_tibiofibular_trunk_L212 and E;
                        #     vars r_tibiofibular_trunk_L212 and r;
                        # enddef;
                    instance_mappings = re.findall(r'def map between [a-zA-Z0-9_]+ and ' + instance_name + ' for(.+?)enddef;', text, re.DOTALL)
                    # # and vice versa
                    # re.findall(r'def map between ' + instance_name + ' and [a-zA-Z0-9_]+ for(.+?)enddef;', text, re.DOTALL)
                    # instance_mappings.append()
                    param_tuples = fun_lib.perametrizeInstances(instance_mappings, param_set)
                    properties = list()
                    for param in param_tuples: properties.append(' = '.join(param))
                    param_string = ', '.join(properties)
                    # find mapping between isntance name and 
                    instances.append(r"\t" + package_name + "." + object_name + " " + instance_name + r'('+ param_string + r') "generated instance";')
                    # instances = instances + instance
                    # insert the encapsulations as instances

            # 2nd type of mapping - connect parameters with variables
            print('>> Looking for sibling mappings for the component '+ instance_name + '...')
            parameter_mappings = re.findall(r'def map between ' + instance_name + r' and ' + parent_name + ' for(.+?)enddef;', text, re.DOTALL)
            params = fun_lib.perametrizeInstances(parameter_mappings, param_set)
            # TODO also for modules?
            modelRegex = re.compile('(model ' + parent_name + r'.*end ' + parent_name + ')', flags=re.DOTALL)
            models = modelRegex.findall(convertedText_main)
            total = 0
            for model in models: # usually just one
                convertedModel = model
                # find for each of the parameter set, if it does belong to own parameters
                for param in params:
                    # itdoesnt matter if it already was as a parameter or input - this has a priority
                    (convertedModel, replaces) = re.subn(r'Real (' + param[0] + r')[ ]*(\(.*?\))*?;', r'parameter Real \1\2 = ' + param[1] + ';', convertedModel)
                    total += replaces
                    # TODO rewritten parameter?
                convertedText_main = modelRegex.sub(convertedModel, convertedText_main)
            if total > 0: print('>> Total: '+ str(total) + ' occurences found and inserted.\n')
            

        # insert all the found instances
        if len(instances) > 0:
            instances_string = r'\n' + r'\n'.join(reversed(instances)) + r"\n"
            # append it just under the model definition
            convertedText_main = re.sub(r'(model ' + par[0] + '.*)', r'\1' + instances_string, convertedText_main)

# 3rd type of mapping
# resolving mappings within the main text.
# these can be resolved only on higher level
# Pseudocode:
# * find environment - if not there, create one and create all instances in there
# * find mapping


fw = open('convertedCellMl.mo','w')
t = datetime.datetime.now()
fw.write('package ConvertedCellMl "automatically generated on ' + t.strftime(r"%Y-%m-%d %H:%M") +'"\n')
fw.write(convertedText_modules)
fw.write(convertedText_main)
fw.write('\nend ConvertedCellMl;')



print(r'Yo! "Job Done"')