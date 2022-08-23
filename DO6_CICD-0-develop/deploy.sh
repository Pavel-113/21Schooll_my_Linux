#!/bin/bash
scp src/cat/s21_cat src/grep/s21_grep student@172.24.116.8:/home/student/
ssh student@172.24.116.8 "echo student | sudo -S mv s21_cat s21_grep /usr/local/bin/ | exit"

