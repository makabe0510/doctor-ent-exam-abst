#for filename in ~/Dropbox/pdf/humanoids-twimp/*.pdf; do pdfcrop ~/Dropbox/pdf/humanoids-twimp/$filename.pdf ~/paper_submittion/humanoids2018_twimp/figs_orig/$filename ; done
for filename in ~/Dropbox/pdf/doctor_exam/*.pdf; do pdfcrop $filename ../figs/${filename##*/} ; done
