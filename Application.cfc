/**
CFML Complexity Metric Tool
    Copyright (C) 2011  Nathan Strutz

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

*/
component{

	this.name = "CFComplexity";

	function onApplicationStart(){
		application.complexity = new system.CFComplexityAppDriver().init();
		if(structKeyExists(url, 'config')){
			application.config = this.loadConfig(url.config);
		}else{
			application.config = this.loadConfig('default');
		}
	}

	function onRequestStart() {
		if (structKeyExists(url, "init")) {
			onApplicationStart();
		}
	}

	function onRequestEnd(){
		if(structKeyExists(url, 'show')){
			echo("<hr /><h1>Showing: #url.show# scope</h1>");
			switch(url.show){
				case "app":{
					writedump(application);
				}
				default:{
					writeOutput("select a dump scope");
					break;
				}
			}
		}
	}

	private struct function loadConfig(required string configFile){
		var config = {};
		var configFile = '/configs/' & arguments.configFile & '.json';
		config.file = arguments.configFile;
		if(fileExists(expandPath(configFile))){
			config = fileRead(configFile);
		}else{
			config = setDefaults();
		}
		if(isJSON(local.config)){
			config = deserializeJSON(config);
		}
		return config;
	}

	private struct function setDefaults(){
		result = {
			baselineComplexity=0,
			reporter='cfml'
		}
		return result;
	}

}