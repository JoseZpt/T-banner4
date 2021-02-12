#!/bin/python2
#coding=utf-8
import os,sys,time
def maung(n):
  for m in n + '\n':
    sys.stdout.write(m)
    sys.stdout.flush()
    time.sleep(0.001)
banner = """
[0m[1;31m
                                        :`  .
                                       -s- -o.
                                       -do./d+`
                           .`-+:-`:o:` -hd+/dh:
                       .+++++mmmdhNmdy++dmhshds-
                    ..-oNNNNNNNNNNNNNNmmmmmdmdds-
                  +hdmmNNNNNNNmmmmmNNNmmmmmmdddds:`
                -+mNNNNNdy+::-----:+shmmmmmddddddy:
               .sdNNNNNd+-           `-ohmmmddddhddo`
              `:dNNNNh-..               .+hdddddhshms.
             `:dmmNNN:..                  .sddddddhmmy-
             .osmNmNm-..                    :sdddddmmmo'
             `:NNNNNs..                      ./ydddmmh-`
               sdmNNNNs-                         -odmmmms-
              `-.:mNNNNd+.                         .ommmmmh-
                 `ydhmNNNds:.                       +mmmmh.
                   .`:odmNNNds/.`                    -mmh+``
                       `.-+ydmNNmds+-`                -:.`
                         ``-/oydmNNmyo-
                                `.:oymmmh+.
                                    `-ohmmo.
                                         .odd:
                                           `od:
                                             /d`
                                              y.
                                             .`[0m"""
os.system("clear")
maung(banner)
os.system("clear")
print (banner)
print
