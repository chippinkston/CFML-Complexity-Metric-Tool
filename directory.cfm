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

--->
<cfparam name="url.directory" default="#expandPath('/')#" />
<cfsetting requesttimeout="900" />

<cf_layout title="Directory Listing" directory="#url.directory#">

<!--- if it's just a file check, forward to the appropriate place --->
<cfif fileExists(url.directory)>
	<cflocation url="file.cfm?file=#url.directory#" />
</cfif>

<cfset complexityReport = application.complexity.getDirectoryComplexityReport(url.directory) />
<cfset dirReport = complexityReport.getDirectoryReport() />


<cfoutput><h2>Directory #url.directory#</h2></cfoutput>
<table class="dirReport">
	<thead>
		<tr>
			<td>Path</td>
			<td>Complexity</td>
		</tr>
	</thead>
	<tbody>
	<cfoutput query="dirReport">
		<tr>
			<td><cfif type EQ "file"><a href="file.cfm?directory=#url.directory#&file=#path#" class="mono">#relativePath#</a><cfelse>#relativePath#</cfif></td>
			<td align="right"><cfif complexity>#complexity#<cfelse>--</cfif></td>
		</tr>
	</cfoutput>
	</tbody>
</table>


<script type="text/javascript">
	$("table.dirReport tbody tr").colorFade(function(){
		return parseInt($(this).find("td:last").html());
	}, function(){
		return $(this);//.find("td:last");
	});
</script>

</cf_layout>