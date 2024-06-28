# folder_structure_generator.py
import os
import subprocess
import sys

# Specify the directory path
user_input = input("Enter Feature name: ")
BASE_DIR= user_input
directory = 'lib/features/'
base_directory_generator = os.getcwd()
print(base_directory_generator)

# Change the current working directory
os.chdir(directory)

os.makedirs(BASE_DIR, exist_ok=True)

os.makedirs(BASE_DIR+'/data', exist_ok=True)
os.makedirs(BASE_DIR+'/data/data_source', exist_ok=True)
os.makedirs(BASE_DIR+'/data/mappers', exist_ok=True)
os.makedirs(BASE_DIR+'/data/models', exist_ok=True)
os.makedirs(BASE_DIR+'/data/services', exist_ok=True)

os.makedirs(BASE_DIR+'/domain', exist_ok=True)
os.makedirs(BASE_DIR+'/domain/entities', exist_ok=True)
os.makedirs(BASE_DIR+'/domain/repositories', exist_ok=True)
os.makedirs(BASE_DIR+'/domain/use_case', exist_ok=True)

os.makedirs(BASE_DIR+'/presentation', exist_ok=True)
os.makedirs(BASE_DIR+'/presentation/manager', exist_ok=True)
os.makedirs(BASE_DIR+'/presentation/pages', exist_ok=True)

print(f"File '{BASE_DIR}' structure created successfully.")

os.chdir(base_directory_generator+'/generator')
subprocess.run(["python3", "PY_service_class_generator.py",user_input])
os.chdir(base_directory_generator+'/generator')
subprocess.run(["python3", "PY_data_source_class_generator.py",user_input])
os.chdir(base_directory_generator+'/generator')
subprocess.run(["python3", "PY_repository_class_generator.py",user_input])
os.chdir(base_directory_generator+'/generator')
subprocess.run(["python3", "PY_bloc_class_generator.py",user_input])



# Run Script
# python3 PY_$folder_structure_generator.py


