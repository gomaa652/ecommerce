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
directory = BASE_DIR+'/data/services'
os.chdir(directory)

def generate_dart_file(file_name, class_name):
    template = f'''
import 'package:retrofit/dio.dart';

abstract class {class_name} {{
}}
'''
    with open(file_name, 'w') as file:
        file.write(template) 

# Example usage
file_name = BASE_NAME + '_service.dart'
class_name = BASE_NAME.capitalize()+'Service'


generate_dart_file(file_name, class_name)
print(f"Dart file '{file_name}' generated successfully.")
#_____________________________________________________







def generate_dart_file(file_name_impl, class_name_impl):
    template = f'''
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';
import '{file_name}';

part '{part}';

@RestApi()
@Injectable(as: {class_name})
abstract class {class_name_impl} implements {class_name} {{

@factoryMethod
  factory {class_name_impl}(@Named('Dio') Dio dio) => _{class_name_impl}(dio);
}}
'''
    with open(file_name_impl, 'w') as file:
        file.write(template) 

# Example usage
file_name_impl = BASE_NAME + '_service_impl.dart'
part = BASE_NAME +'_service_impl.g.dart'
class_name_impl = BASE_NAME.capitalize()+'ServiceImpl'

generate_dart_file(file_name_impl, class_name_impl)
print(f"Dart file '{file_name_impl}' generated successfully.")





# Run Script
# python3 PY_service_class_generator.py
