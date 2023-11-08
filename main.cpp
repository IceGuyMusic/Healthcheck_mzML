#include <OpenMS/FORMAT/MzMLFile.h>
#include <OpenMS/KERNEL/MSExperiment.h>
#include <iostream>

// using namespace
using namespace std;
using namespace OpenMS;

int main(int argc, char **argv) {
    if (argc != 3) {
        cerr << "Usage: " << argv[0] << " -f <path_to_mzML_file>" << endl;
        return 1;
    }


    string flag(argv[1]);
    string file_path(argv[2]);


    if (flag != "-f") {
        cerr << "Invalid flag. Use -f to specify the mzML file path." << endl;
        return 1;
    }

    MzMLFile mzml_file;
    MSExperiment experiment;

  // Load mzML to see if its corrupt
    try {
        mzml_file.load(file_path, experiment);
    } catch (Exception::FileNotFound& fnf) {
        cerr << "File not found: " << fnf.what() << endl;
        return 1;
    } catch (Exception::BaseException& e) {
        cerr << "An error occurred while reading the mzML file: " << e.what() << endl;
        return 1;
    }

    cout << "The mzML file was successfully opened and can be read." << endl;

    return 0;
}
