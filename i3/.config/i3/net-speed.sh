<!DOCTYPE html>
<html lang='en'>
<head>
<title>net-speed.sh\contrib - i3status - MIRROR of https://github.com/i3/i3status</title>
<meta name='generator' content='cgit v1.1'/>
<meta name='robots' content='index, nofollow'/>
<link rel='stylesheet' type='text/css' href='/static/cgit.css'/>
<link rel='shortcut icon' href='/static/favicon.png'/>
<link rel='alternate' title='Atom feed' href='http://code.stapelberg.de/git/i3status/atom/contrib/net-speed.sh?h=master' type='application/atom+xml'/>
<link rel='vcs-git' href='git://code.i3wm.org/i3status' title='i3status Git repository'/>
</head>
<body>
<div id='cgit'><table id='header'>
<tr>
<td class='logo' rowspan='2'><a href='/git/'><img src='/static/cgit.png' alt='cgit logo'/></a></td>
<td class='main'><a href='/git/'>index</a> : <a title='i3status' href='/git/i3status/'>i3status</a></td><td class='form'><form method='get'>
<select name='h' onchange='this.form.submit();'>
<option value='master' selected='selected'>master</option>
</select> <input type='submit' value='switch'/></form></td></tr>
<tr><td class='sub'>MIRROR of https://github.com/i3/i3status</td><td class='sub right'>michael+i3status@stapelberg.de</td></tr></table>
<table class='tabs'><tr><td>
<a href='/git/i3status/'>summary</a><a href='/git/i3status/refs/'>refs</a><a href='/git/i3status/log/contrib/net-speed.sh'>log</a><a class='active' href='/git/i3status/tree/contrib/net-speed.sh'>tree</a><a href='/git/i3status/commit/contrib/net-speed.sh'>commit</a><a href='/git/i3status/diff/contrib/net-speed.sh'>diff</a></td><td class='form'><form class='right' method='get' action='/git/i3status/log/contrib/net-speed.sh'>
<select name='qt'>
<option value='grep'>log msg</option>
<option value='author'>author</option>
<option value='committer'>committer</option>
<option value='range'>range</option>
</select>
<input class='txt' type='text' size='10' name='q' value=''/>
<input type='submit' value='search'/>
</form>
</td></tr></table>
<div class='path'>path: <a href='/git/i3status/tree/'>root</a>/<a href='/git/i3status/tree/contrib'>contrib</a>/<a href='/git/i3status/tree/contrib/net-speed.sh'>net-speed.sh</a></div><div class='content'>blob: 71a563fa99341e10932bf9806367e2362494a1ee (<a href='/git/i3status/plain/contrib/net-speed.sh'>plain</a>)
<table summary='blob content' class='blob'>
<tr><td class='linenumbers'><pre><a id='n1' href='#n1'>1</a>
<a id='n2' href='#n2'>2</a>
<a id='n3' href='#n3'>3</a>
<a id='n4' href='#n4'>4</a>
<a id='n5' href='#n5'>5</a>
<a id='n6' href='#n6'>6</a>
<a id='n7' href='#n7'>7</a>
<a id='n8' href='#n8'>8</a>
<a id='n9' href='#n9'>9</a>
<a id='n10' href='#n10'>10</a>
<a id='n11' href='#n11'>11</a>
<a id='n12' href='#n12'>12</a>
<a id='n13' href='#n13'>13</a>
<a id='n14' href='#n14'>14</a>
<a id='n15' href='#n15'>15</a>
<a id='n16' href='#n16'>16</a>
<a id='n17' href='#n17'>17</a>
<a id='n18' href='#n18'>18</a>
<a id='n19' href='#n19'>19</a>
<a id='n20' href='#n20'>20</a>
<a id='n21' href='#n21'>21</a>
<a id='n22' href='#n22'>22</a>
<a id='n23' href='#n23'>23</a>
<a id='n24' href='#n24'>24</a>
<a id='n25' href='#n25'>25</a>
<a id='n26' href='#n26'>26</a>
<a id='n27' href='#n27'>27</a>
<a id='n28' href='#n28'>28</a>
<a id='n29' href='#n29'>29</a>
<a id='n30' href='#n30'>30</a>
<a id='n31' href='#n31'>31</a>
<a id='n32' href='#n32'>32</a>
<a id='n33' href='#n33'>33</a>
<a id='n34' href='#n34'>34</a>
<a id='n35' href='#n35'>35</a>
<a id='n36' href='#n36'>36</a>
<a id='n37' href='#n37'>37</a>
<a id='n38' href='#n38'>38</a>
<a id='n39' href='#n39'>39</a>
<a id='n40' href='#n40'>40</a>
<a id='n41' href='#n41'>41</a>
<a id='n42' href='#n42'>42</a>
<a id='n43' href='#n43'>43</a>
<a id='n44' href='#n44'>44</a>
<a id='n45' href='#n45'>45</a>
<a id='n46' href='#n46'>46</a>
<a id='n47' href='#n47'>47</a>
<a id='n48' href='#n48'>48</a>
<a id='n49' href='#n49'>49</a>
<a id='n50' href='#n50'>50</a>
<a id='n51' href='#n51'>51</a>
<a id='n52' href='#n52'>52</a>
<a id='n53' href='#n53'>53</a>
<a id='n54' href='#n54'>54</a>
<a id='n55' href='#n55'>55</a>
<a id='n56' href='#n56'>56</a>
<a id='n57' href='#n57'>57</a>
<a id='n58' href='#n58'>58</a>
<a id='n59' href='#n59'>59</a>
<a id='n60' href='#n60'>60</a>
<a id='n61' href='#n61'>61</a>
<a id='n62' href='#n62'>62</a>
<a id='n63' href='#n63'>63</a>
<a id='n64' href='#n64'>64</a>
<a id='n65' href='#n65'>65</a>
<a id='n66' href='#n66'>66</a>
<a id='n67' href='#n67'>67</a>
<a id='n68' href='#n68'>68</a>
<a id='n69' href='#n69'>69</a>
<a id='n70' href='#n70'>70</a>
<a id='n71' href='#n71'>71</a>
<a id='n72' href='#n72'>72</a>
<a id='n73' href='#n73'>73</a>
<a id='n74' href='#n74'>74</a>
<a id='n75' href='#n75'>75</a>
<a id='n76' href='#n76'>76</a>
<a id='n77' href='#n77'>77</a>
<a id='n78' href='#n78'>78</a>
<a id='n79' href='#n79'>79</a>
</pre></td>
<td class='lines'><pre><code>#!/bin/sh

# Authors:
# - Moritz Warning &lt;moritzwarning@web.de&gt; (2016)
# - Zhong Jianxin &lt;azuwis@gmail.com&gt; (2014)
#
# See file LICENSE at the project root directory for license information.
#
# i3status.conf should contain:
# general {
#   output_format = i3bar
# }
#
# i3 config looks like this:
# bar {
#   status_command exec /usr/share/doc/i3status/contrib/net-speed.sh
# }
#
# Single interface:
# ifaces="eth0"
#
# Multiple interfaces:
# ifaces="eth0 wlan0"
#

# Auto detect interfaces
ifaces=$(ls /sys/class/net | grep -E '^(eth|wlan|enp|wlp)')

last_time=0
last_rx=0
last_tx=0
rate=""

readable() {
  local bytes=$1
  local kib=$(( bytes &gt;&gt; 10 ))
  if [ $kib -lt 0 ]; then
    echo "? K"
  elif [ $kib -gt 1024 ]; then
    local mib_int=$(( kib &gt;&gt; 10 ))
    local mib_dec=$(( kib % 1024 * 976 / 10000 ))
    if [ "$mib_dec" -lt 10 ]; then
      mib_dec="0${mib_dec}"
    fi
    echo "${mib_int}.${mib_dec} M"
  else
    echo "${kib} K"
  fi
}

update_rate() {
  local time=$(date +%s)
  local rx=0 tx=0 tmp_rx tmp_tx

  for iface in $ifaces; do
    read tmp_rx &lt; "/sys/class/net/${iface}/statistics/rx_bytes"
    read tmp_tx &lt; "/sys/class/net/${iface}/statistics/tx_bytes"
    rx=$(( rx + tmp_rx ))
    tx=$(( tx + tmp_tx ))
  done

  local interval=$(( $time - $last_time ))
  if [ $interval -gt 0 ]; then
    rate="$(readable $(( (rx - last_rx) / interval )))↓ $(readable $(( (tx - last_tx) / interval )))↑"
  else
    rate=""
  fi

  last_time=$time
  last_rx=$rx
  last_tx=$tx
}

i3status | (read line &amp;&amp; echo "$line" &amp;&amp; read line &amp;&amp; echo "$line" &amp;&amp; read line &amp;&amp; echo "$line" &amp;&amp; update_rate &amp;&amp; while :
do
  read line
  update_rate
  echo ",[{\"full_text\":\"${rate}\" },${line#,\[}" || exit 1
done)
</code></pre></td></tr></table>
</div> <!-- class=content -->
<div class='footer'>generated by <a href='https://git.zx2c4.com/cgit/about/'>cgit v1.1</a> at 2018-12-04 11:27:10 +0000</div>
</div> <!-- id=cgit -->
</body>
</html>
