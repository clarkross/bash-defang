# defang.sh
Simple bash defang script for files &amp; strings. Uses predefined sed input to replace certain characters quickly.

# Usage
> Note: this is a copy of the help output.

	defang.sh -d|r <filepath>
	defang.sh -s|rs <string>
	defang.sh -h

Flags:<p>
	```-d```: defang file<br>
	```-r```: restore file<br>
	```-s```: string: input string<br>
	```-rs```: restore string<br>
	```-h```: help

# Function
The following replacements are made:
* . -> [.]
  * defangs IPs / domain suffix.
* @ -> [@]
  * defangs address sign.
* http -> hXXp
  * defangs link.
 
# Example usage

**Using file defang flags**
```bash
clark@debian-vm:~/Desktop$ cat test.txt 
0.0.0.0
1.2.3.4 
a.b.c.d

test@example.com
tester123@moreexamples.com

http://example1.com/
https://example2.com/
clark@debian-vm:~/Desktop$ 
clark@debian-vm:~/Desktop$ ./defang.sh -d test.txt
clark@debian-vm:~/Desktop$ 
clark@debian-vm:~/Desktop$ cat test.txt 
0[.]0[.]0[.]0
1[.]2[.]3[.]4 
a[.]b[.]c[.]d

test[@]example[.]com
tester123[@]moreexamples[.]com

hXXp://example1[.]com/
hXXps://example2[.]com/
clark@debian-vm:~/Desktop$ 
clark@debian-vm:~/Desktop$ ./defang.sh -r test.txt
clark@debian-vm:~/Desktop$ 
clark@debian-vm:~/Desktop$ cat test.txt 
0.0.0.0
1.2.3.4 
a.b.c.d

test@example.com
tester123@moreexamples.com

http://example1.com/
https://example2.com/
clark@debian-vm:~/Desktop$
```

**Using string defang flags**
```bash
clark@debian-vm:~/Desktop$ 
clark@debian-vm:~/Desktop$ 
clark@debian-vm:~/Desktop$ ./defang.sh -s http://example.com/
hXXp://example[.]com/
clark@debian-vm:~/Desktop$ 
clark@debian-vm:~/Desktop$ ./defang.sh -rs http://example.com/
http://example.com/
clark@debian-vm:~/Desktop$ 
clark@debian-vm:~/Desktop$ 
clark@debian-vm:~/Desktop$ ./defang.sh -s 10.38.10.110
10[.]38[.]10[.]110
clark@debian-vm:~/Desktop$ 
clark@debian-vm:~/Desktop$ ./defang.sh -s tester@example.com
tester[@]example[.]com
clark@debian-vm:~/Desktop$ 
clark@debian-vm:~/Desktop$ 
clark@debian-vm:~/Desktop$
```
