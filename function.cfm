<!---
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

---><cfparam name="url.directory" default="#expandPath('/')#" />
<cfparam name="url.file" />
<cfparam name="url.function" />

<cfset complexityReport = application.complexity.getFunctionComplexityReport(url.file, url.function) />

<cf_layout title="Function Complexity" directory="#url.directory#" file="#url.file#" function="#url.function#">

<cfoutput>
	<h2>File #url.file#</h2>
	<h3>Function #url.function#</h3>
	<h4>Overall Function Complexity: #complexityReport.getBasicComplexityCount()#</h4>
</cfoutput>

<cfif complexityReport.hasLineByLineDetails()>
	<cf_displaycomplexitycode contentComplexity="#complexityReport.getLineByLineDetails()#" />
</cfif>

</cf_layout>