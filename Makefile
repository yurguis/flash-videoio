VERSION:=3.5
MXMLC45:=/home/yurguis/SDKs/flex_sdk_4.6/bin/mxmlc -define=CONFIG::version,${VERSION}

#all:
#	echo "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<custom:VideoIO xmlns:custom=\"*\" xmlns:mx=\"http://www.adobe.com/2006/mxml\"/>\n" > Wrapper.mxml
#	${MXMLC45} -output bin-release/VideoIO11.swf -compiler.debug=false -define=CONFIG::sdk4,true  -define=CONFIG::player11,true  -target-player 11.0   -swf-version=13 -static-link-runtime-shared-libraries=true -- Wrapper.mxml
	
all:
	echo "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<custom:VideoIO xmlns:custom=\"*\" xmlns:mx=\"http://www.adobe.com/2006/mxml\"/>\n" > Wrapper.mxml
	${MXMLC45} -output bin-debug/VideoIO11.swf   -compiler.debug=true  -define=CONFIG::sdk4,true  -define=CONFIG::player11,true  -target-player 11.1   -swf-version=13 -static-link-runtime-shared-libraries=true -- Wrapper.mxml
	${MXMLC45} -output bin-release/VideoIO11.swf -compiler.debug=true -define=CONFIG::sdk4,true  -define=CONFIG::player11,true  -target-player 11.1   -swf-version=13 -static-link-runtime-shared-libraries=true -- Wrapper.mxml
	cp bin-release/VideoIO11.swf bin-release/VideoIO11-${VERSION}.swfq
	cd bin-release; zip VideoIO-${VERSION}.zip VideoIO11.swf VideoIO45.swf VideoIO.swf

clean: 
	rm -f bin-debug/VideoIO.swf bin-debug/VideoIO45.swf bin-debug/VideoIO11.swf bin-release/VideoIO.swf bin-release/VideoIO45.swf bin-release/VideoIO11.swf bin-debug/VideoPIP.swf

dist: 
	tar -zcvf flash-videoio.tgz Makefile bin-release/AC_OETags.js VideoIO.as VideoPIP.mxml
	
