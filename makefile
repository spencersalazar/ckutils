
DEST=/usr/lib/chuck
CKS=ChannelTest.ck GameTrak.ck Poly.ck Ramp.ck Std2.ck MidiInstrument.ck Feedback.ck

install:
	cp $(CKS) $(DEST)/
