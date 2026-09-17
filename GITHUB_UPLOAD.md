# Uploading the project to GitHub

## Option 1: GitHub website

1. Go to https://github.com/
2. Click **New repository**.
3. A good name is `custom-8bit-processor`.
4. Add a description such as:

   `A custom 8-bit CPU built in Logisim with a shared bus, custom ISA and microcoded control.`

5. Create the repository. You can leave **Add a README** unchecked because this package already contains one.
6. Open the new repository and choose **Add file -> Upload files**.
7. Upload the contents of this folder, keeping the folder structure unchanged.
8. Commit the files.

## Option 2: Git command line

Open a terminal inside this folder:

```bash
git init
git add .
git commit -m "Initial commit - custom 8-bit processor"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/custom-8bit-processor.git
git push -u origin main
```

Replace `YOUR_USERNAME` with your GitHub username.

## Suggested repository description

> A custom 8-bit processor built in Logisim, featuring a shared data/address bus, A/B/C registers, ALU, custom ISA, 256-byte RAM, microcode-based instruction sequencing and register/status monitoring displays.

## Suggested topics

```text
cpu
processor
computer-architecture
digital-design
logisim
assembly
isa
alu
datapath
microcode
8-bit
```
