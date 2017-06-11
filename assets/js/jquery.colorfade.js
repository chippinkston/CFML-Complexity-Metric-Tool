/*
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
/*
 * @purpose Calculates a heat index for an element and applies a bg color (blue through red)
 * @argument srcFn: Callback that returns an integer complexity index for each element
 * @argument targetFn: Callback that returns the element to apply the heat index to
 * @author Nathan Strutz
 * @contact strutz@gmail.com
 */
jQuery.fn.colorFade = function(srcFn,targetFn){
	var $=jQuery;
	var maxComplexity = 1;

	var getHeat = function(maxComplexity,currentComplexity) {
		var rowRedness = (currentComplexity * 255) / maxComplexity;
		return parseInt(rowRedness);
	}

	return this.each(function(i){
		var complexity = srcFn.call(this);
		if (complexity>maxComplexity) {
			maxComplexity = complexity;
		}
	}).each(function(i){
		var t = $(this);
		var lineComplexity = srcFn.call(this);
		var lineHeat = getHeat(maxComplexity, lineComplexity);
		$(targetFn.call(this)).css("background-color", "rgb("+ lineHeat +","+ parseInt(255-(lineHeat/1.5)) +","+ parseInt(255-(lineHeat/1.5)) +")");
	});
}