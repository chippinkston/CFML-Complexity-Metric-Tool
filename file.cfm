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

<cf_layout title="File Complexity" directory="#url.directory#" file="#url.file#">

<cfset complexityReport = application.complexity.getFileComplexityReport(url.file) />

<cfoutput>
	<h2>File #url.file#</h2>
	<h3>Overall File Complexity: #complexityReport.getBasicComplexityCount()#</h3>
</cfoutput>

<cfif complexityReport.hasFunctions()>
	<cfset functions = complexityReport.getFunctions() />
	<table class="functions">
		<thead>
			<tr>
				<td>Function Name</td>
				<td>Lines</td>
				<td>Complexity</td>
			</tr>
		</thead>
		<tbody>
		<cfoutput query="functions">
			<tr>
				<td><a href="function.cfm?directory=#url.directory#&file=#url.file#&function=#name#" class="mono b">#name# ()</a></td>
				<td>#Lines#</td>
				<td>#complexity#</td>
			</tr>
		</cfoutput>
		</tbody>
	</table>

	<script type="text/javascript">
		$("table.functions tbody tr").colorFade(function(){
			return parseInt($(this).find("td:last").html());
		}, function(){
			return $(this);//.find("td:last");
		});
	</script>
<cfelse>
	<h5>No Functions</h5>
</cfif>

<cfif complexityReport.hasLineByLineDetails()>
	<cf_displaycomplexitycode contentComplexity="#complexityReport.getLineByLineDetails()#" />
</cfif>

</cf_layout>