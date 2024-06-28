# folder_structure_generator.py
# Generate Class Test
import os
import sys

if len(sys.argv) > 1:
    user_input = sys.argv[1]
else:
    user_input = input("Enter Feature name: ")
BASE_NAME=user_input
os.chdir('..')
BASE_DIR='lib/features/' + BASE_NAME
directory = BASE_DIR+'/domain/repositories'
os.chdir(directory)

def generate_dart_file(file_name, class_name):
    template = f'''

abstract class {class_name} {{
}}
'''
    with open(file_name, 'w') as file:
        file.write(template) 

# Example usage
file_name = BASE_NAME + '_repository.dart'
class_name = BASE_NAME.capitalize()+'Repository'


generate_dart_file(file_name, class_name)
print(f"Dart file '{file_name}' generated successfully.")
#_____________________________________________________







def generate_dart_file(file_name_impl, class_name_impl):
    template = f'''

import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';
import '../../data/data_source/{BASE_NAME}_data_source.dart';
import '{file_name}';

@Injectable(as: {class_name})
class {class_name_impl} extends {class_name} {{
{"".join([f"final {attribute['type']} {attribute['name']};\n" for attribute in attributes])}

  {class_name_impl}({", ".join([f"this.{attribute['name']}" for attribute in attributes])});


}}
'''
    with open(file_name_impl, 'w') as file:
        file.write(template) 

# Example usage
file_name_impl = BASE_NAME + '_repository_impl.dart'
class_name_impl = BASE_NAME.capitalize()+'RepositoryImpl'
attributes = [
    {'type': BASE_NAME.capitalize()+'DataSource', 'name': '_dataSource'},
]

generate_dart_file(file_name_impl, class_name_impl)
print(f"Dart file '{file_name_impl}' generated successfully.")





# Run Script
# python3 PY_repository_class_generator.py
