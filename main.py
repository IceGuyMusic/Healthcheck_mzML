from flask import Flask, jsonify
import subprocess
import os

app = Flask(__name__)

@app.route('/healthcheck', methods=['GET'])
def healthcheck():
    mzml_directory = '/app/uploads/mzml'
    files = os.listdir(mzml_directory)
    results = {}

    for file in files:
        if file.endswith('.mzML'):
            file_path = os.path.join(mzml_directory, file)
            result = subprocess.run(['FileInfo', '-c', '-in', file_path], stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
            output = result.stdout
            errors = result.stderr
            results[file] = errors

    return jsonify(results)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
