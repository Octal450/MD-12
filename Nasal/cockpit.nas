# McDonnell Douglas MD-12 Cockpit Controls
# Copyright (c) 2026 Josh Davidson (Octal450)

# FCP AFS
var ApPanel = {
	apDisc: func() {
		if (itaf.Output.ap1.getBoolValue()) {
			itaf.ITAF.ap1Master(0);
		}
		if (itaf.Output.ap2.getBoolValue()) {
			itaf.ITAF.ap2Master(0);
		}
		if (itaf.Output.ap3.getBoolValue()) {
			itaf.ITAF.ap3Master(0);
		}
	},
	atDisc: func() {
		if (itaf.Output.athr.getBoolValue()) {
			itaf.ITAF.athrMaster(0);
		}
	},
};
