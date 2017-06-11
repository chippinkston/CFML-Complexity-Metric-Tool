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

---><cfif thistag.executionMode IS "start">
	<cfparam name="attributes.contentComplexity" type="query" />

	<table class="detailedComplexity">
		<cfoutput query="attributes.contentComplexity">
			<tr class="line" title="Line #line#, Complexity Score: #complexity#" data-complexity-score="#complexity#">
				<td class="lineNo">#line#</td>
				<td class="lineCode">#htmlCodeFormat(reReplace(code,"\t", "    ","ALL"))#</td>
			</tr>
		</cfoutput>
	</table>

	<script type="text/javascript">
		$("tr.line").colorFade(function(){
			return parseInt($(this).data("complexity-score"));
		}, function(){
			return $(this).find("td.lineCode");
		});
	</script>
</cfif>