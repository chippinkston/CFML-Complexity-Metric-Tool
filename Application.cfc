component{

	this.name = "CFComplexity";

	function onApplicationStart(){
		application.complexity = new system.CFComplexityAppDriver().init();
		if(structKeyExists(url, 'config')){
			this.loadConfig(url.config);
		}else{
			this.loadConfig('default');
		}
	}

	function onRequestStart() {
		if (structKeyExists(url, "init")) {
			onApplicationStart();
		}
	}

	private void function loadConfig(required string configFile){
		var config = {};
		var configFile = '/configs/' & arguments.configFile & '.json'
		if(fileExists(expandPath(configFile))){
			config = fileRead(configFile);
		}else{
			config = setDefaults();
		}
		if(isJSON(local.config)){
			config = deserializeJSON(config);
		}
		for(key in config){
			application[key] = config[key];
		}
	}

	private struct function setDefaults(){
		result = {
			baselineComplexity=0,
			reporter='cfml'
		};
		return result;
	}

}