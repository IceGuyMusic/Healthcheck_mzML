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
    result = subprocess.run(['FileInfo', '-c','-in', file_path], capture_output=True, text=True)
    results[file] = str(result)

    return jsonify(results)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
