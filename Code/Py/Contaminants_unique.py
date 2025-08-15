#!/usr/bin/env python
# coding: utf-8

#Empty string to save the headers to
header = ''
#Empty list to save the sequences that have been checked to
seq_list = []
#Empty dictionary to save the header and sequences to
fasta_clean = {}

#For each line in the cleaned contaminants file
for line in open('contaminants_cleaned.fasta'):
    #If the line starts with '>' (and is therefore a header line)
    if line.startswith('>'):
        #Assign the line to the header string
        header = line
    #Else if the line starts a nucleotide letter
    elif line.startswith(('A', 'C', 'T', 'G')):
        #Set the checker to false
        check = False
        #For each item in the sequence list
        for item in seq_list:
            #Check if the sequence currenlty being looked at is in the list already (and therefore not unique)
            if line == item:
                #Set the checker to true
                check = True
        #If the chcker is still false (and therefore the sequence is new/unique one)
        if check == False:
            #Add the sequence to the list so it doesn't get added again in the future
            seq_list.append(line)
            #And assign it to the dictionary with the header as the key and the sequence as the value
            fasta_clean[header] = line

#Turn the dictionary of unique sequences into a string so it can be written to a fasta file
fasta_unique = ''.join(f"{k}{v}" for k, v in fasta_clean.items())

#With the fasta file for the unique sequences open as to write to
with open('contaminants_unique.fasta', 'w') as clean:
    #Write the unique sequences to the fasta file
    clean.write(fasta_unique)

