#!/usr/bin/env python
# coding: utf-8

#Empty dictionary to write the fasta files to remove to
remove_dict = {}

#For each line in the file of over represented sequences
for line in open('Over_represented_sequences.txt'):
    #Split the line at the tabs as it is a tsv
    col = line.split('	')
    #If the 4th (0 indexing) 'column' is Yes (meaning it should be in the final fasta file or sequences to remove)
    if (col[3]) == 'Yes\n':
        #Header line, with a new line at the start, same header as was in the orginal fasta file of extracted over represented sequences
        header = ('\n' + col[0])
        #Sequence line, again with a new line at the start
        seq = ('\n' + col[1])
        #Add the header and sequence to the dictionary as the key and value respectively
        remove_dict[header] = seq

#The dictionary is then translated into a string so it can be written to a fasta file
remove_fasta = ''.join(f"{k}{v}" for k, v in remove_dict.items())

#With the fasta file to be written to open as to write to
with open('remove_contaminants.fasta', 'w') as rmv:
    #Write the generated string
    rmv.write(remove_fasta)

#Empty string to write each line of the two fasta files to
combined_fasta = ''''''

#For each line in the downloaded adapter sequence file
for line in open('Sequencing_adaptors.fasta'):
    #Add the line to the string
    combined_fasta += line

#Add a new line to the string to keep the formatting consistant
combined_fasta += '\n'

#For each line in the cleaned extracted over represented sequences fasta 
for line in open('remove_contaminants.fasta'):
    #Add the line to the string
    combined_fasta += line

#With the fasta file to be written to open as to write to
with open('all_contaminants.fasta', 'w') as total:
    #Write the string of all extracted sequences to the fasta file
    total.write(combined_fasta)