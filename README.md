# Disclo: Keyword Search in PDF Files

## How to Use

To use it, simply provide an input file with URLs from your target.  
**Disclo** will filter out URLs that contain a PDF file.  

It will then review them one by one, searching for the keywords defined in the script:  
`strictly private|confidential|internal use only`  

You can customize the script to remove or add keywords, for example:  
`strictly private|confidential|internal use only|another string`

## Requirements

Disclo is a Bash script that uses the `pdftotext` library. To install it on Debian/Ubuntu Linux, run the following command:  

```bash
$ sudo apt-get install poppler-utils
```

## Example Usage
```bash
./disclo.sh URLs_list.txt output_file.txt
```
Disclo will execute and display how many PDF files were detected in the list.
It will then process them one by one. When a keyword is found, it will display the URL and the matching keyword in the terminal.

Additionally, it will generate an output file in the same directory containing the URLs that include the specified keywords.
