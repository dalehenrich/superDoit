export
exportClass: filePath
	"write the script class to disk as a .gs file"

	filePath asFileReference
		writeStreamDo: [ :fileStream | fileStream nextPutAll: self class fileOutClass ]