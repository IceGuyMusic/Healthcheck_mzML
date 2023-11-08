from flask import Flask, jsonify
import subprocess
import os

app = Flask(__name__)

@app.route('/healthcheck', methods=['GET'])
def healthcheck():
    mzml_directory = '/app/uploads/mzml'
    #files = os.listdir(mzml_directory)
    files = ['Test.mzml']
    results = {}

    #for file in files:
    #    if files.endswith('.mzml'):
            #file_path = os.path.join(mzml_directory, file)
    file_path = 'Test.mzml'
    result = subprocess.run(['FileInfo', '-c', '-in', file_path], stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
    # Now you can access result.stdout and result.stderr
    output = result.stdout
    errors = result.stderr
    results[file] = str(output, errors)

    return jsonify(results)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
