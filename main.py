from flask import Flask, jsonify
import subprocess
import os

app = Flask(__name__)

@app.route('/healthcheck', methods=['GET'])
def healthcheck():
    mzml_directory = './'    #'/app/uploads/mzml'
    files = os.listdir(mzml_directory)
    #files = ['Test.mzML']
    results = {}

    for file in files:
        if file.endswith('.mzML'):
            file_path = os.path.join(mzml_directory, file)
            #file_path = 'Test.mzML'
            result = subprocess.run(['FileInfo', '-c', '-in', file_path], stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
            # Now you can access result.stdout and result.stderr
            output = result.stdout
            errors = result.stderr
            results[files[0]] = errors

    return jsonify(results)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
