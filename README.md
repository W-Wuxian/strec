# Start recording

Bash functions to record softwares installation procedure.
to used it either copy paste the content of strec.bash to your .bashrc or add the following to it:
```bash
if [ -f ~/strec.bash ]; then
    . ~/strec.bash
fi
```
afterwards two functions are collable form a shell:
- `cphisto` **histoname**
  + stands for copy history
  + it does create the folder `${FOLDER}` if it doesn not exist, by default **~/.recinstall** and also the file `${FOLDER}/${histoname}` if does not exis, with **.histo** as default name
  + `cphisto` captures commands executed from a shell and copy pastes them to `${FOLDER}/${histoname}`

- `addmkcb` **histoname fname cblang**
  + to be run after `cphisto` and stands for add markdown code blocks
  + **histoname** should be the same used for `cphisto`
  + **fname** the name of the markdown file will be create, and it should represent the recorded commands, by default set to .session1
  + **cblang** the markdown code block language, if by default set to powershell, and convert entry "bash" to powershell.
  + so at the end it create a markdown file `${FOLDER}/${fname}.md` with recorded commands inside code block using **cblang** as language.

# example:
Assuming **strec.bash** is deployed via ansible on every machine on root account or just copy paste if needed.
Imagine you have to install software KitV2 on st-lin-toto:
- connect to machine
```bash
ssh tempo@st-lin-toto
sudo su
```
- start installing a software
```
git clone hhtps://git/KitV2.git
cd KitV2
uv venv /opt/UVENV/KitV2
. /opt/UVENV/KitV2/bin/activate
uv pip install -r req.txt
```
- record and generate the install procedure using markdonw format:
```bash
cphisto .histo-kitv2-install
addmkcb .histo-kitv2-install kitv2-install bash
```
It does generate the installation procedure at **~/.recinstall**

# TODO
- [ ] add tag system, to attach a procedure to user name and keep track of installed software
- [ ] add git system to generated markdown files, to automatically send them on your self host git
- [ ] or add nginx to do the same
