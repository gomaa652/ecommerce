# folder_structure_generator.py
# Generate Class Test
import os
import sys
if len(sys.argv) > 1:
    user_input = sys.argv[1]
else:
    user_input = input("Enter Feature name: ")
BASE_NAME=user_input
bloc_input = input("Enter Bloc name: ")
BLOC_NAME=bloc_input
if os.getcwd().find("generator") != -1:
   os.chdir('..')
BASE_DIR='lib/features/' + BASE_NAME
directory = BASE_DIR+'/presentation/manager/'+BLOC_NAME+'_bloc'
os.makedirs(directory, exist_ok=True)
os.chdir(directory)

def generate_dart_file(file_name, class_name):
    template = f'''

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '{part_event}';
part '{part_state}';
part '{part_freezed}';

class {class_name} extends Bloc<{class_event},{class_state}> {{

{class_name}() : super({class_state}()); 

}}
'''
    with open(file_name, 'w') as file:
        file.write(template) 

# Example usage
file_name = BLOC_NAME + '_bloc.dart'
class_name = BLOC_NAME.capitalize()+'Bloc'
class_event = BLOC_NAME.capitalize()+'Event'
class_state = BLOC_NAME.capitalize()+'State'

part_bloc= BLOC_NAME +'_bloc.dart'
part_event= BLOC_NAME +'_event.dart'
part_state = BLOC_NAME +'_state.dart'
part_freezed = BLOC_NAME +'_bloc.freezed.dart'


generate_dart_file(file_name, class_name)
print(f"Dart file '{file_name}' generated successfully.")
#_____________________________________________________
#State

def generate_dart_file(file_name_state, class_state):
    template = f'''

part of '{part_bloc}';

@freezed
class {class_state} with _${class_state} {{
 factory {class_state}({
    '{bool? isLoading,}'
  }) = _{class_state};
}}
'''
    with open(file_name_state, 'w') as file:
        file.write(template) 

# Example usage
file_name_state = BLOC_NAME + '_state.dart'

generate_dart_file(file_name_state, class_state)
print(f"Dart file '{file_name_state}' generated successfully.")

#_____________________________________________________
#Event

def generate_dart_file(file_name_event, class_event):
    template = f'''

part of '{part_bloc}';

@freezed
class {class_event} with _${class_event} {{
factory {class_event}.test() = _test;
}}
'''
    with open(file_name_event, 'w') as file:
        file.write(template) 

# Example usage
file_name_event = BLOC_NAME + '_event.dart'

generate_dart_file(file_name_event, class_event)
print(f"Dart file '{file_name_event}' generated successfully.")



# Run Script
# python3 PY_bloc_class_generator.py
