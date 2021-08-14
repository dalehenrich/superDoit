*superdoit-core31-5
exit: message withStatus: statusInteger
	"exiting image with an exit status not supported until 3.6.0"

	self logErrorMessage: message.
	System logout