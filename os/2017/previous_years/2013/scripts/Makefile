include include.mak
INSTALL_PATH=/usr/local/bin/course-scripts
SPROGS = $(COURSE)-ta-script $(COURSE)-ta-notes $(COURSE)-submit-lab1 $(COURSE)-get-submission $(COURSE)-submit-pintos
UPROGS = $(COURSE)-score
target: $(SPROGS) $(UPROGS)

$(COURSE)-ta-script: csl373-ta-script.c
	gcc -static $< -o $@
	cp -f $@ $(INSTALL_PATH)/$@
	chmod 711 $(INSTALL_PATH)/$@
	chmod u+s $(INSTALL_PATH)/$@

$(COURSE)-ta-notes: csl373-ta-notes.c
	gcc -static $< -o $@
	cp -f $@ $(INSTALL_PATH)/$@
	chmod 711 $(INSTALL_PATH)/$@
	chmod u+s $(INSTALL_PATH)/$@

$(COURSE)-submit-lab1: csl373-submit-lab1.c
	gcc -static $< -o $@
	cp -f $@ $(INSTALL_PATH)/$@
	chmod 711 $(INSTALL_PATH)/$@
	chmod u+s $(INSTALL_PATH)/$@

$(COURSE)-get-submission: csl373-get-submission.c
	gcc -static $< -o $@
	cp -f $@ $(INSTALL_PATH)/$@
	chmod 711 $(INSTALL_PATH)/$@
	chmod u+s $(INSTALL_PATH)/$@

$(COURSE)-submit-pintos: csl373-submit-pintos.c
	gcc -static $< -o $@
	cp -f $@ $(INSTALL_PATH)/$@
	chmod 711 $(INSTALL_PATH)/$@
	chmod u+s $(INSTALL_PATH)/$@

$(UPROGS)::
	cp -f $@ $(INSTALL_PATH)/$@
	chmod 755 $(INSTALL_PATH)/$@

clean::
	rm -rf csl373-ta-script
