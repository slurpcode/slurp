import os
import sys
import requests
import time

mypath = 'logos'
img_url = 'https://raw.githubusercontent.com/fuchsia-programming \
/fuchsia-programming.github.io/master/assets/images/logos/'

if not os.path.isdir(mypath):
   os.makedirs(mypath)

def check_arguments():
    if len(sys.argv) > 1:
        return sys.argv[1]
    return False

def working_directory():
    owd = os.getcwd()
    os.chdir(owd + "/" + mypath)
    cur_path = os.getcwd()

    if cur_path:        
        number = check_arguments()
        if not number:
            j = 306
        else:
            j = number
        for i in range(int(j)+1):
            img_name = 'fuchsia-'+str(i)+'.png'
            with open(img_name, 'wb') as handle:
                response = requests.get(img_url+img_name, stream=True)
                if not response.ok:
                    print(response)
                for block in response.iter_content(1024):
                    if not block:
                        break
                    handle.write(block)
            time.sleep(5)
    else:
        sys.exit()

def main():
    cur_path = working_directory()
    print(cur_path)

if __name__ == "__main__":
    main()
