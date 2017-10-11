import csv

reader = csv.DictReader(open('updated_file.txt','rb'),delimiter='\t')
reader.fieldnames = ['rid','']