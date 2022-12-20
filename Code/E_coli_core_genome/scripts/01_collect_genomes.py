#!/usr/bin/env python3

# run from top directory
import subprocess

import pandas as pd

genomes = pd.read_csv("./in_data/Supp-Table-1-core-genome-strains.txt", comment="#", sep=",", header=0)
accessions = genomes["NCBI Refseq ID"]

subprocess.call("mkdir ./out_data/genomes".split())

for acc in accessions:
    cmd = f"ncbi-acc-download {acc} --format fasta --verbose --out out_data/genomes/{acc}.fasta"
    subprocess.call(cmd.split())
