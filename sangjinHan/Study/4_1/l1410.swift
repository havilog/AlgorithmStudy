//1410. HTML Entity Parser
/*
Input: text = "&amp; is an HTML entity but &ambassador; is not."
Output: "& is an HTML entity but &ambassador; is not."
Explanation: The parser will replace the &amp; entity by &
*/

// let text: String = "&amp; is an HTML entity but &ambassador; is not."
let text: String = "x &gt; y &amp;&amp; x &lt; y is always false"
let dict: [String:String] = ["&quot;":"\"","&apos;":"\'","&amp;":"&","&gt;":">","&lt;":"<","&frasl;":"/"]

var temp: String = ""
var answer: String = ""

var check: Bool = false

for i in text.indices{
	if text[i] == "&"{
		check = true
	}else if text[i] == ";"{
		temp.append(text[i])
		check = false
		answer.append(dict[temp] ?? temp)
		temp = ""
		continue
	}
	
	if check{
		temp.append(text[i])
	}else{
		answer.append(text[i])
	}
}

print(answer)