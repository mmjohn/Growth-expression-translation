#!/usr/bin/env python3

# takes a couple hours
# had to manually squash a few bugs with Prokka via conda

import glob
import subprocess

subprocess.call("mkdir ./out_data/annotations".split())

for fasta in glob.glob("./out_data/genomes/*.fasta"):
    acc = fasta.split("/")[-1].split(".")[0]  # this is just the date -- mistake on my end
    cmd = f"prokka {fasta} --usegenus Escherichia --outdir out_data/annotations/{acc}"
    subprocess.call(cmd.split())
