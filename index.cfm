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
<cf_layout>

<form method="get" action="directory.cfm">
	<cfoutput>
	Enter a directory or file path<br/>
	<input name="directory" value="#expandPath('/')#" size="60" />
	<br/>
	<input type="submit" value="Check Complexity" />
	</cfoutput>
</form>

</cf_layout>