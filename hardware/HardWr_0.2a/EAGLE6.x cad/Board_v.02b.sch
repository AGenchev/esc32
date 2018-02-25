<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="6.5.0">
<drawing>
<settings>
<setting alwaysvectorfont="yes"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="13" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="50" name="dxf" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="53" name="tGND_GNDA" color="7" fill="9" visible="no" active="no"/>
<layer number="54" name="bGND_GNDA" color="1" fill="9" visible="no" active="no"/>
<layer number="56" name="wert" color="7" fill="1" visible="no" active="no"/>
<layer number="57" name="tCAD" color="7" fill="1" visible="no" active="no"/>
<layer number="59" name="tCarbon" color="7" fill="1" visible="no" active="no"/>
<layer number="60" name="bCarbon" color="7" fill="1" visible="no" active="no"/>
<layer number="90" name="Modules" color="7" fill="1" visible="no" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
<layer number="99" name="SpiceOrder" color="7" fill="1" visible="no" active="no"/>
<layer number="100" name="Muster" color="7" fill="1" visible="yes" active="yes"/>
<layer number="101" name="Patch_Top" color="12" fill="4" visible="yes" active="yes"/>
<layer number="102" name="Mittellin" color="7" fill="1" visible="yes" active="yes"/>
<layer number="103" name="Stiffner" color="7" fill="1" visible="yes" active="yes"/>
<layer number="104" name="Name" color="7" fill="1" visible="yes" active="yes"/>
<layer number="105" name="Beschreib" color="7" fill="1" visible="yes" active="yes"/>
<layer number="106" name="BGA-Top" color="7" fill="1" visible="yes" active="yes"/>
<layer number="107" name="BD-Top" color="7" fill="1" visible="yes" active="yes"/>
<layer number="108" name="tBridges" color="7" fill="1" visible="yes" active="yes"/>
<layer number="109" name="tBPL" color="7" fill="1" visible="yes" active="yes"/>
<layer number="110" name="bBPL" color="7" fill="1" visible="yes" active="yes"/>
<layer number="111" name="MPL" color="7" fill="1" visible="yes" active="yes"/>
<layer number="112" name="tSilk" color="7" fill="1" visible="yes" active="yes"/>
<layer number="113" name="ReferenceLS" color="7" fill="1" visible="no" active="no"/>
<layer number="116" name="Patch_BOT" color="7" fill="1" visible="yes" active="yes"/>
<layer number="118" name="Rect_Pads" color="7" fill="1" visible="no" active="no"/>
<layer number="121" name="sName" color="7" fill="1" visible="yes" active="yes"/>
<layer number="122" name="_bPlace" color="7" fill="1" visible="yes" active="yes"/>
<layer number="123" name="tTestmark" color="7" fill="1" visible="yes" active="yes"/>
<layer number="124" name="bTestmark" color="7" fill="1" visible="yes" active="yes"/>
<layer number="125" name="_tNames" color="7" fill="1" visible="yes" active="yes"/>
<layer number="126" name="_bNames" color="7" fill="1" visible="yes" active="yes"/>
<layer number="127" name="_tValues" color="7" fill="1" visible="yes" active="yes"/>
<layer number="128" name="_bValues" color="7" fill="1" visible="yes" active="yes"/>
<layer number="129" name="Mask" color="7" fill="1" visible="yes" active="yes"/>
<layer number="131" name="prix" color="7" fill="1" visible="yes" active="yes"/>
<layer number="132" name="test" color="7" fill="1" visible="yes" active="yes"/>
<layer number="144" name="Drill_legend" color="7" fill="1" visible="yes" active="yes"/>
<layer number="150" name="Notes" color="7" fill="1" visible="no" active="yes"/>
<layer number="151" name="HeatSink" color="7" fill="1" visible="yes" active="yes"/>
<layer number="152" name="_bDocu" color="7" fill="1" visible="yes" active="yes"/>
<layer number="153" name="FabDoc1" color="6" fill="1" visible="no" active="no"/>
<layer number="154" name="FabDoc2" color="2" fill="1" visible="no" active="no"/>
<layer number="155" name="FabDoc3" color="7" fill="15" visible="no" active="no"/>
<layer number="199" name="Contour" color="7" fill="1" visible="yes" active="yes"/>
<layer number="200" name="200bmp" color="1" fill="10" visible="yes" active="yes"/>
<layer number="201" name="201bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="202" name="202bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="203" name="203bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="204" name="204bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="205" name="205bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="206" name="206bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="207" name="207bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="208" name="208bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="209" name="209bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="210" name="210bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="211" name="211bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="212" name="212bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="213" name="213bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="214" name="214bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="215" name="215bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="216" name="216bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="217" name="217bmp" color="18" fill="1" visible="no" active="no"/>
<layer number="218" name="218bmp" color="19" fill="1" visible="no" active="no"/>
<layer number="219" name="219bmp" color="20" fill="1" visible="no" active="no"/>
<layer number="220" name="220bmp" color="21" fill="1" visible="no" active="no"/>
<layer number="221" name="221bmp" color="22" fill="1" visible="no" active="no"/>
<layer number="222" name="222bmp" color="23" fill="1" visible="no" active="no"/>
<layer number="223" name="223bmp" color="24" fill="1" visible="no" active="no"/>
<layer number="224" name="224bmp" color="25" fill="1" visible="no" active="no"/>
<layer number="225" name="225bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="226" name="226bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="227" name="227bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="228" name="228bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="229" name="229bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="230" name="230bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="231" name="Eagle3D_PG1" color="7" fill="1" visible="no" active="no"/>
<layer number="232" name="Eagle3D_PG2" color="7" fill="1" visible="no" active="no"/>
<layer number="233" name="Eagle3D_PG3" color="7" fill="1" visible="no" active="no"/>
<layer number="248" name="Housing" color="7" fill="1" visible="yes" active="yes"/>
<layer number="249" name="Edge" color="7" fill="1" visible="yes" active="yes"/>
<layer number="250" name="Descript" color="7" fill="1" visible="yes" active="yes"/>
<layer number="251" name="SMDround" color="7" fill="1" visible="yes" active="yes"/>
<layer number="254" name="cooling" color="7" fill="1" visible="yes" active="yes"/>
<layer number="255" name="routoute" color="7" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="microbuilder">
<description>&lt;h2&gt;&lt;b&gt;microBuilder.eu&lt;/b&gt; Eagle Footprint Library&lt;/h2&gt;

&lt;p&gt;Footprints for common components used in our projects and products.  This is the same library that we use internally, and it is regularly updated.  The newest version can always be found at &lt;b&gt;www.microBuilder.eu&lt;/b&gt;.  If you find this library useful, please feel free to purchase something from our online store. Please also note that all holes are optimised for metric drill bits!&lt;/p&gt;

&lt;h3&gt;Obligatory Warning&lt;/h3&gt;
&lt;p&gt;While it probably goes without saying, there are no guarantees that the footprints or schematic symbols in this library are flawless, and we make no promises of fitness for production, prototyping or any other purpose. These libraries are provided for information puposes only, and are used at your own discretion.  While we make every effort to produce accurate footprints, and many of the items found in this library have be proven in production, we can't make any promises of suitability for a specific purpose. If you do find any errors, though, please feel free to contact us at www.microbuilder.eu to let us know about it so that we can update the library accordingly!&lt;/p&gt;

&lt;h3&gt;License&lt;/h3&gt;
&lt;p&gt;This work is placed in the public domain, and may be freely used for commercial and non-commercial work with the following conditions:&lt;/p&gt;
&lt;p&gt;THIS SOFTWARE IS PROVIDED ''AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE INSTITUTE OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,  BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
&lt;/p&gt;</description>
<packages>
<package name="0805">
<description>0805 (2012 Metric)</description>
<wire x1="-1.873" y1="0.883" x2="1.873" y2="0.883" width="0.0508" layer="39"/>
<wire x1="1.873" y1="-0.883" x2="-1.873" y2="-0.883" width="0.0508" layer="39"/>
<wire x1="-1.873" y1="-0.883" x2="-1.873" y2="0.883" width="0.0508" layer="39"/>
<wire x1="-0.381" y1="0.66" x2="0.381" y2="0.66" width="0.1016" layer="51"/>
<wire x1="-0.356" y1="-0.66" x2="0.381" y2="-0.66" width="0.1016" layer="51"/>
<wire x1="1.873" y1="0.883" x2="1.873" y2="-0.883" width="0.0508" layer="39"/>
<wire x1="1.8" y1="0.9" x2="1.8" y2="-0.9" width="0.2032" layer="21"/>
<wire x1="1.8" y1="-0.9" x2="-1.8" y2="-0.9" width="0.2032" layer="21"/>
<wire x1="-1.8" y1="-0.9" x2="-1.8" y2="0.9" width="0.2032" layer="21"/>
<wire x1="-1.8" y1="0.9" x2="1.8" y2="0.9" width="0.2032" layer="21"/>
<smd name="1" x="-0.95" y="0" dx="1.3" dy="1.5" layer="1"/>
<smd name="2" x="0.95" y="0" dx="1.3" dy="1.5" layer="1"/>
<text x="2.032" y="-0.127" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="2.032" y="-0.762" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-1.0922" y1="-0.7239" x2="-0.3421" y2="0.7262" layer="51"/>
<rectangle x1="0.3556" y1="-0.7239" x2="1.1057" y2="0.7262" layer="51"/>
<rectangle x1="-0.1001" y1="-0.4001" x2="0.1001" y2="0.4001" layer="35"/>
</package>
<package name="1206">
<description>1206 (3216 Metric)</description>
<wire x1="-2.473" y1="0.983" x2="2.473" y2="0.983" width="0.0508" layer="39"/>
<wire x1="2.473" y1="-0.983" x2="-2.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-2.473" y1="-0.983" x2="-2.473" y2="0.983" width="0.0508" layer="39"/>
<wire x1="2.473" y1="0.983" x2="2.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-0.965" y1="0.787" x2="0.965" y2="0.787" width="0.1016" layer="51"/>
<wire x1="-0.965" y1="-0.787" x2="0.965" y2="-0.787" width="0.1016" layer="51"/>
<wire x1="-2.4" y1="1" x2="2.4" y2="1" width="0.2032" layer="21"/>
<wire x1="2.4" y1="1" x2="2.4" y2="-1" width="0.2032" layer="21"/>
<wire x1="2.4" y1="-1" x2="-2.4" y2="-1" width="0.2032" layer="21"/>
<wire x1="-2.4" y1="-1" x2="-2.4" y2="1" width="0.2032" layer="21"/>
<smd name="1" x="-1.4" y="0" dx="1.6" dy="1.8" layer="1"/>
<smd name="2" x="1.4" y="0" dx="1.6" dy="1.8" layer="1"/>
<text x="2.54" y="-0.127" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="2.54" y="-0.635" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-1.7018" y1="-0.8509" x2="-0.9517" y2="0.8491" layer="51"/>
<rectangle x1="0.9517" y1="-0.8491" x2="1.7018" y2="0.8509" layer="51"/>
<rectangle x1="-0.1999" y1="-0.4001" x2="0.1999" y2="0.4001" layer="35"/>
</package>
<package name="0603">
<description>0603 (1608 Metric)</description>
<wire x1="-1.473" y1="0.729" x2="1.473" y2="0.729" width="0.0508" layer="39"/>
<wire x1="1.473" y1="0.729" x2="1.473" y2="-0.729" width="0.0508" layer="39"/>
<wire x1="1.473" y1="-0.729" x2="-1.473" y2="-0.729" width="0.0508" layer="39"/>
<wire x1="-1.473" y1="-0.729" x2="-1.473" y2="0.729" width="0.0508" layer="39"/>
<wire x1="-0.356" y1="0.432" x2="0.356" y2="0.432" width="0.1016" layer="51"/>
<wire x1="-0.356" y1="-0.419" x2="0.356" y2="-0.419" width="0.1016" layer="51"/>
<wire x1="-1.6" y1="0.7" x2="1.6" y2="0.7" width="0.2032" layer="21"/>
<wire x1="1.6" y1="0.7" x2="1.6" y2="-0.7" width="0.2032" layer="21"/>
<wire x1="1.6" y1="-0.7" x2="-1.6" y2="-0.7" width="0.2032" layer="21"/>
<wire x1="-1.6" y1="-0.7" x2="-1.6" y2="0.7" width="0.2032" layer="21"/>
<smd name="1" x="-0.85" y="0" dx="1.1" dy="1" layer="1"/>
<smd name="2" x="0.85" y="0" dx="1.1" dy="1" layer="1"/>
<text x="1.778" y="-0.127" size="0.8128" layer="25" font="vector" ratio="18">&gt;NAME</text>
<text x="1.778" y="-0.762" size="0.4064" layer="27" font="vector" ratio="10">&gt;VALUE</text>
<rectangle x1="-0.8382" y1="-0.4699" x2="-0.3381" y2="0.4801" layer="51"/>
<rectangle x1="0.3302" y1="-0.4699" x2="0.8303" y2="0.4801" layer="51"/>
<rectangle x1="-0.1999" y1="-0.3" x2="0.1999" y2="0.3" layer="35"/>
</package>
<package name="0402">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
chip</description>
<wire x1="-0.245" y1="0.224" x2="0.245" y2="0.224" width="0.2032" layer="51"/>
<wire x1="0.245" y1="-0.224" x2="-0.245" y2="-0.224" width="0.2032" layer="51"/>
<wire x1="-1.346" y1="0.483" x2="1.346" y2="0.483" width="0.0508" layer="39"/>
<wire x1="1.346" y1="0.483" x2="1.346" y2="-0.483" width="0.0508" layer="39"/>
<wire x1="1.346" y1="-0.483" x2="-1.346" y2="-0.483" width="0.0508" layer="39"/>
<wire x1="-1.346" y1="-0.483" x2="-1.346" y2="0.483" width="0.0508" layer="39"/>
<wire x1="-1.27" y1="-0.635" x2="-1.27" y2="0.635" width="0.2032" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="1.27" y2="0.635" width="0.2032" layer="21"/>
<wire x1="1.27" y1="0.635" x2="1.27" y2="-0.635" width="0.2032" layer="21"/>
<wire x1="1.27" y1="-0.635" x2="-1.27" y2="-0.635" width="0.2032" layer="21"/>
<smd name="1" x="-0.65" y="0" dx="0.7" dy="0.9" layer="1"/>
<smd name="2" x="0.65" y="0" dx="0.7" dy="0.9" layer="1"/>
<text x="1.397" y="-0.1905" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="1.397" y="-0.635" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-0.554" y1="-0.3048" x2="-0.254" y2="0.2951" layer="51"/>
<rectangle x1="0.2588" y1="-0.3048" x2="0.5588" y2="0.2951" layer="51"/>
<rectangle x1="-0.1999" y1="-0.3" x2="0.1999" y2="0.3" layer="35"/>
</package>
<package name="0603-MINI">
<description>0603-Mini
&lt;p&gt;Mini footprint for dense boards&lt;/p&gt;</description>
<wire x1="-1.346" y1="0.583" x2="1.346" y2="0.583" width="0.0508" layer="39"/>
<wire x1="1.346" y1="0.583" x2="1.346" y2="-0.583" width="0.0508" layer="39"/>
<wire x1="1.346" y1="-0.583" x2="-1.346" y2="-0.583" width="0.0508" layer="39"/>
<wire x1="-1.346" y1="-0.583" x2="-1.346" y2="0.583" width="0.0508" layer="39"/>
<wire x1="-1.37" y1="-0.635" x2="-1.37" y2="0.635" width="0.2032" layer="21"/>
<wire x1="-1.37" y1="0.635" x2="1.37" y2="0.635" width="0.2032" layer="21"/>
<wire x1="1.37" y1="0.635" x2="1.37" y2="-0.635" width="0.2032" layer="21"/>
<wire x1="1.37" y1="-0.635" x2="-1.37" y2="-0.635" width="0.2032" layer="21"/>
<wire x1="-0.356" y1="0.432" x2="0.356" y2="0.432" width="0.1016" layer="51"/>
<wire x1="-0.356" y1="-0.419" x2="0.356" y2="-0.419" width="0.1016" layer="51"/>
<smd name="1" x="-0.75" y="0" dx="0.9" dy="0.9" layer="1"/>
<smd name="2" x="0.75" y="0" dx="0.9" dy="0.9" layer="1"/>
<text x="1.524" y="-0.0635" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="1.524" y="-0.635" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-0.8382" y1="-0.4699" x2="-0.3381" y2="0.4801" layer="51"/>
<rectangle x1="0.3302" y1="-0.4699" x2="0.8303" y2="0.4801" layer="51"/>
</package>
<package name="0805_NOTHERMALS">
<wire x1="-1.873" y1="0.883" x2="1.873" y2="0.883" width="0.0508" layer="39"/>
<wire x1="1.873" y1="-0.883" x2="-1.873" y2="-0.883" width="0.0508" layer="39"/>
<wire x1="-1.873" y1="-0.883" x2="-1.873" y2="0.883" width="0.0508" layer="39"/>
<wire x1="-0.381" y1="0.66" x2="0.381" y2="0.66" width="0.1016" layer="51"/>
<wire x1="-0.356" y1="-0.66" x2="0.381" y2="-0.66" width="0.1016" layer="51"/>
<wire x1="1.873" y1="0.883" x2="1.873" y2="-0.883" width="0.0508" layer="39"/>
<wire x1="1.8" y1="0.9" x2="1.8" y2="-0.9" width="0.2032" layer="21"/>
<wire x1="1.8" y1="-0.9" x2="-1.8" y2="-0.9" width="0.2032" layer="21"/>
<wire x1="-1.8" y1="-0.9" x2="-1.8" y2="0.9" width="0.2032" layer="21"/>
<wire x1="-1.8" y1="0.9" x2="1.8" y2="0.9" width="0.2032" layer="21"/>
<smd name="1" x="-0.95" y="0" dx="1.3" dy="1.5" layer="1" thermals="no"/>
<smd name="2" x="0.95" y="0" dx="1.3" dy="1.5" layer="1" thermals="no"/>
<text x="2.032" y="-0.127" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="2.032" y="-0.762" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-1.0922" y1="-0.7239" x2="-0.3421" y2="0.7262" layer="51"/>
<rectangle x1="0.3556" y1="-0.7239" x2="1.1057" y2="0.7262" layer="51"/>
</package>
<package name="_0402">
<description>&lt;b&gt; 0402&lt;/b&gt;</description>
<wire x1="-0.245" y1="0.174" x2="0.245" y2="0.174" width="0.1016" layer="51"/>
<wire x1="0.245" y1="-0.174" x2="-0.245" y2="-0.174" width="0.1016" layer="51"/>
<wire x1="-1.0573" y1="0.5557" x2="1.0573" y2="0.5557" width="0.2032" layer="21"/>
<wire x1="1.0573" y1="0.5557" x2="1.0573" y2="-0.5556" width="0.2032" layer="21"/>
<wire x1="1.0573" y1="-0.5556" x2="-1.0573" y2="-0.5557" width="0.2032" layer="21"/>
<wire x1="-1.0573" y1="-0.5557" x2="-1.0573" y2="0.5557" width="0.2032" layer="21"/>
<smd name="1" x="-0.508" y="0" dx="0.6" dy="0.6" layer="1"/>
<smd name="2" x="0.508" y="0" dx="0.6" dy="0.6" layer="1"/>
<text x="-0.9525" y="0.7939" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-0.9525" y="-1.3336" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-0.0794" y1="-0.2381" x2="0.0794" y2="0.2381" layer="35"/>
<rectangle x1="0.25" y1="-0.25" x2="0.5" y2="0.25" layer="51"/>
<rectangle x1="-0.5" y1="-0.25" x2="-0.25" y2="0.25" layer="51"/>
</package>
<package name="_0402MP">
<description>&lt;b&gt;0402 MicroPitch&lt;p&gt;</description>
<wire x1="-0.245" y1="0.174" x2="0.245" y2="0.174" width="0.1016" layer="51"/>
<wire x1="0.245" y1="-0.174" x2="-0.245" y2="-0.174" width="0.1016" layer="51"/>
<wire x1="0" y1="0.127" x2="0" y2="-0.127" width="0.2032" layer="21"/>
<smd name="1" x="-0.508" y="0" dx="0.5" dy="0.5" layer="1"/>
<smd name="2" x="0.508" y="0" dx="0.5" dy="0.5" layer="1"/>
<text x="-0.635" y="0.4763" size="0.6096" layer="25" ratio="18">&gt;NAME</text>
<text x="-0.635" y="-0.7938" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-0.1" y1="-0.2" x2="0.1" y2="0.2" layer="35"/>
<rectangle x1="-0.5" y1="-0.25" x2="-0.254" y2="0.25" layer="51"/>
<rectangle x1="0.2588" y1="-0.25" x2="0.5" y2="0.25" layer="51"/>
</package>
<package name="_0603">
<description>&lt;b&gt;0603&lt;/b&gt;</description>
<wire x1="-0.432" y1="-0.306" x2="0.432" y2="-0.306" width="0.1016" layer="51"/>
<wire x1="0.432" y1="0.306" x2="-0.432" y2="0.306" width="0.1016" layer="51"/>
<wire x1="-1.4605" y1="0.635" x2="1.4605" y2="0.635" width="0.2032" layer="21"/>
<wire x1="1.4605" y1="0.635" x2="1.4605" y2="-0.635" width="0.2032" layer="21"/>
<wire x1="1.4605" y1="-0.635" x2="-1.4605" y2="-0.635" width="0.2032" layer="21"/>
<wire x1="-1.4605" y1="-0.635" x2="-1.4605" y2="0.635" width="0.2032" layer="21"/>
<smd name="1" x="-0.762" y="0" dx="0.9" dy="0.8" layer="1"/>
<smd name="2" x="0.762" y="0" dx="0.9" dy="0.8" layer="1"/>
<text x="-1.27" y="0.9525" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-1.27" y="-1.4923" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="0.4318" y1="-0.4" x2="0.8382" y2="0.4" layer="51"/>
<rectangle x1="-0.8382" y1="-0.4" x2="-0.4318" y2="0.4" layer="51"/>
<rectangle x1="-0.1999" y1="-0.4001" x2="0.1999" y2="0.4001" layer="35"/>
</package>
<package name="_0603MP">
<description>&lt;b&gt;0603 MicroPitch&lt;/b&gt;</description>
<wire x1="-0.432" y1="-0.306" x2="0.432" y2="-0.306" width="0.1016" layer="51"/>
<wire x1="0.432" y1="0.306" x2="-0.432" y2="0.306" width="0.1016" layer="51"/>
<wire x1="0" y1="0.254" x2="0" y2="-0.254" width="0.2032" layer="21"/>
<smd name="1" x="-0.762" y="0" dx="0.8" dy="0.8" layer="1"/>
<smd name="2" x="0.762" y="0" dx="0.8" dy="0.8" layer="1"/>
<text x="-0.9525" y="0.635" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-0.9525" y="-0.9525" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="0.4318" y1="-0.4" x2="0.8" y2="0.4" layer="51"/>
<rectangle x1="-0.8" y1="-0.4" x2="-0.4318" y2="0.4" layer="51"/>
<rectangle x1="-0.1999" y1="-0.25" x2="0.1999" y2="0.25" layer="35"/>
</package>
<package name="_0805">
<description>&lt;b&gt;0805&lt;/b&gt;</description>
<wire x1="-0.41" y1="0.585" x2="0.41" y2="0.585" width="0.1016" layer="51"/>
<wire x1="-0.41" y1="-0.585" x2="0.41" y2="-0.585" width="0.1016" layer="51"/>
<wire x1="-1.905" y1="0.889" x2="1.905" y2="0.889" width="0.2032" layer="21"/>
<wire x1="1.905" y1="0.889" x2="1.905" y2="-0.889" width="0.2032" layer="21"/>
<wire x1="1.905" y1="-0.889" x2="-1.905" y2="-0.889" width="0.2032" layer="21"/>
<wire x1="-1.905" y1="-0.889" x2="-1.905" y2="0.889" width="0.2032" layer="21"/>
<smd name="1" x="-1.016" y="0" dx="1.2" dy="1.3" layer="1"/>
<smd name="2" x="1.016" y="0" dx="1.2" dy="1.3" layer="1"/>
<text x="-1.5875" y="1.27" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-1.5874" y="-1.651" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="0.4064" y1="-0.65" x2="1.0564" y2="0.65" layer="51"/>
<rectangle x1="-1.0668" y1="-0.65" x2="-0.4168" y2="0.65" layer="51"/>
<rectangle x1="-0.1999" y1="-0.5001" x2="0.1999" y2="0.5001" layer="35"/>
</package>
<package name="_0805MP">
<description>&lt;b&gt;0805 MicroPitch&lt;/b&gt;</description>
<wire x1="-0.51" y1="0.535" x2="0.51" y2="0.535" width="0.1016" layer="51"/>
<wire x1="-0.51" y1="-0.535" x2="0.51" y2="-0.535" width="0.1016" layer="51"/>
<wire x1="0" y1="0.508" x2="0" y2="-0.508" width="0.2032" layer="21"/>
<smd name="1" x="-1.016" y="0" dx="1.2" dy="1.3" layer="1"/>
<smd name="2" x="1.016" y="0" dx="1.2" dy="1.3" layer="1"/>
<text x="-1.5875" y="0.9525" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-1.5875" y="-1.27" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="0.4064" y1="-0.65" x2="1" y2="0.65" layer="51"/>
<rectangle x1="-1" y1="-0.65" x2="-0.4168" y2="0.65" layer="51"/>
<rectangle x1="-0.1999" y1="-0.5001" x2="0.1999" y2="0.5001" layer="35"/>
</package>
<package name="2012">
<wire x1="-1.662" y1="1.245" x2="1.662" y2="1.245" width="0.2032" layer="51"/>
<wire x1="-1.637" y1="-1.245" x2="1.687" y2="-1.245" width="0.2032" layer="51"/>
<wire x1="-3.473" y1="1.483" x2="3.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="3.473" y1="1.483" x2="3.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="3.473" y1="-1.483" x2="-3.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="-3.473" y1="-1.483" x2="-3.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="-3.302" y1="1.524" x2="3.302" y2="1.524" width="0.2032" layer="21"/>
<wire x1="3.302" y1="1.524" x2="3.302" y2="-1.524" width="0.2032" layer="21"/>
<wire x1="3.302" y1="-1.524" x2="-3.302" y2="-1.524" width="0.2032" layer="21"/>
<wire x1="-3.302" y1="-1.524" x2="-3.302" y2="1.524" width="0.2032" layer="21"/>
<smd name="1" x="-2.2" y="0" dx="1.8" dy="2.7" layer="1"/>
<smd name="2" x="2.2" y="0" dx="1.8" dy="2.7" layer="1"/>
<text x="-2.54" y="1.8415" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-2.667" y="-2.159" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-2.4892" y1="-1.3208" x2="-1.6393" y2="1.3292" layer="51"/>
<rectangle x1="1.651" y1="-1.3208" x2="2.5009" y2="1.3292" layer="51"/>
</package>
<package name="2512">
<description>&lt;b&gt;RESISTOR 2512 (Metric 6432)&lt;/b&gt;</description>
<wire x1="-2.362" y1="1.473" x2="2.387" y2="1.473" width="0.2032" layer="51"/>
<wire x1="-2.362" y1="-1.473" x2="2.387" y2="-1.473" width="0.2032" layer="51"/>
<wire x1="-3.973" y1="1.983" x2="3.973" y2="1.983" width="0.0508" layer="39"/>
<wire x1="3.973" y1="1.983" x2="3.973" y2="-1.983" width="0.0508" layer="39"/>
<wire x1="3.973" y1="-1.983" x2="-3.973" y2="-1.983" width="0.0508" layer="39"/>
<wire x1="-3.973" y1="-1.983" x2="-3.973" y2="1.983" width="0.0508" layer="39"/>
<smd name="1" x="-2.8" y="0" dx="1.8" dy="3.2" layer="1"/>
<smd name="2" x="2.8" y="0" dx="1.8" dy="3.2" layer="1"/>
<text x="-3.683" y="1.905" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-3.556" y="-2.286" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-3.2004" y1="-1.5494" x2="-2.3505" y2="1.5507" layer="51"/>
<rectangle x1="2.3622" y1="-1.5494" x2="3.2121" y2="1.5507" layer="51"/>
<rectangle x1="-0.5001" y1="-1" x2="0.5001" y2="1" layer="35"/>
</package>
</packages>
<symbols>
<symbol name="CAPACITOR">
<wire x1="0" y1="0.762" x2="0" y2="0" width="0.1524" layer="94"/>
<wire x1="0" y1="2.54" x2="0" y2="1.778" width="0.1524" layer="94"/>
<text x="2.54" y="2.54" size="1.27" layer="95" font="vector">&gt;NAME</text>
<text x="2.54" y="0" size="1.27" layer="96" font="vector">&gt;VALUE</text>
<rectangle x1="-1.27" y1="0.508" x2="1.27" y2="1.016" layer="94"/>
<rectangle x1="-1.27" y1="1.524" x2="1.27" y2="2.032" layer="94"/>
<pin name="P$1" x="0" y="5.08" visible="off" length="short" direction="pas" swaplevel="1" rot="R270"/>
<pin name="P$2" x="0" y="-2.54" visible="off" length="short" direction="pas" swaplevel="1" rot="R90"/>
</symbol>
<symbol name="GND">
<wire x1="-1.27" y1="0" x2="1.27" y2="0" width="0.254" layer="94"/>
<text x="-1.524" y="-2.54" size="1.27" layer="96">&gt;VALUE</text>
<pin name="GND" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
<symbol name="RESISTOR">
<wire x1="-2.54" y1="1.27" x2="2.54" y2="1.27" width="0.254" layer="94"/>
<wire x1="2.54" y1="1.27" x2="2.54" y2="-1.27" width="0.254" layer="94"/>
<wire x1="2.54" y1="-1.27" x2="-2.54" y2="-1.27" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-1.27" x2="-2.54" y2="1.27" width="0.254" layer="94"/>
<text x="-2.54" y="2.032" size="1.27" layer="95" font="vector">&gt;NAME</text>
<text x="-2.54" y="-3.175" size="1.27" layer="96" font="vector">&gt;VALUE</text>
<pin name="1" x="-5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1"/>
<pin name="2" x="5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="CAP_CERAMIC" prefix="C" uservalue="yes">
<description>&lt;p&gt;&lt;b&gt;Ceramic Capacitors&lt;/b&gt;&lt;/p&gt;
&lt;b&gt;0402&lt;/b&gt; - 0402 Surface Mount Capacitors
&lt;ul&gt;
&lt;li&gt;16pF 50V 5% [Digikey: 445-4899-2-ND]&lt;/li&gt;
&lt;li&gt;18pF 50V 5% [Digikey: 490-1281-2-ND]&lt;/li&gt;
&lt;li&gt;22pF 50V 5% [Digikey: 490-1283-2-ND]&lt;/li&gt;
&lt;li&gt;68pF 50V 5% [Digikey: 490-1289-2-ND]&lt;/li&gt;
&lt;li&gt;0.1uF 10V 10% [Digikey: 490-1318-2-ND]&lt;/li&gt;
&lt;li&gt;1.0uF 6.3V 10% [Digikey: 490-1320-2-ND]&lt;/li&gt;
&lt;/ul&gt;
&lt;b&gt;0603&lt;/b&gt; - 0603 Surface Mount Capacitors
&lt;ul&gt;
&lt;li&gt;16 pF 50V 5% [Digikey: 445-5051-2-ND]&lt;/li&gt;
&lt;li&gt;22 pF 50V [Digikey: PCC220ACVTR-ND]&lt;/li&gt;
&lt;li&gt;33 pF 50V 5% [Digikey: 490-1415-1-ND]&lt;/li&gt;
&lt;li&gt;56pF 50V 5% [Digikey: 490-1421-1-ND]&lt;/li&gt;
&lt;li&gt;220pF 50V 5% [Digikey: 445-1285-1-ND]&lt;/li&gt;
&lt;li&gt;680 pF 50V &lt;/li&gt;
&lt;li&gt;2200 pF 50V 5% C0G [Digikey: 445-1297-1-ND]&lt;/li&gt;
&lt;li&gt;5600 pF 100V 5% X7R [Digikey: 478-3711-1-ND]&lt;/li&gt;
&lt;li&gt;0.1 µF 25V 10% [Digikey: PCC2277TR-ND]&lt;/li&gt;
&lt;li&gt;0.22 µF 16V 10% X7R [Digikey: 445-1318-1-ND]&lt;/li&gt;
&lt;li&gt;1.0 µF 25V 10% [Digikey: 445-5146-2-ND]&lt;/li&gt;
&lt;/ul&gt;
&lt;b&gt;0603&lt;/b&gt; - RF Specific
&lt;ul&gt;
&lt;li&gt;3pF 250V +/-0.1pF RF [Digikey: 712-1347-1-ND]&lt;/li&gt;
&lt;li&gt;18 pF 250V 5%  [Digikey: 478-3505-1-ND or 712-1322-1-ND]&lt;/li&gt;
&lt;li&gt;56 pF 250V 5% C0G RF [Digikey: 490-4867-1-ND]&lt;/li&gt;
&lt;li&gt;68 pF 250V RF [Digikey: 490-4868-1-ND]&lt;/li&gt;
&lt;/ul&gt;
&lt;b&gt;0805&lt;/b&gt; - 0805 Surface Mount Capacitors
&lt;ul&gt;
&lt;li&gt;220 pF 250V 2% &lt;strong&gt;RF&lt;/strong&gt; Ceramic Capacitor [Digikey: 712-1398-1-ND]&lt;/li&gt;
&lt;li&gt;1000 pF 50V 2% NP0 Ceramic Capacitor [Digikey: 478-3760-1-ND]&lt;/li&gt;
&lt;li&gt;0.1 µF 25V 10% Ceramic Capacitor [Digikey: PCC1828TR-ND]&lt;/li&gt;
&lt;li&gt;1.0 µF 16V 10% Ceramic Capacitor[Digikey: 490-1691-2-ND]&lt;/li&gt;
&lt;li&gt;10.0 µF 10V 10% Ceramic Capacitor[Digikey: 709-1228-1-ND]&lt;/li&gt;
&lt;li&gt;10.0 uF 16V 10% Ceramic Capacitor [Digikey: 478-5165-2-ND]&lt;/li&gt;
&lt;li&gt;47 uF 6.3V 20% Ceramic Capacitor [Digikey: 587-1779-1-ND or 399-5506-1-ND]&lt;/li&gt;
&lt;/ul&gt;
&lt;/ul&gt;&lt;b&gt;1206&lt;/b&gt; - 1206 Surface Mount Capacitors
&lt;ul&gt;
&lt;li&gt;47uF 10V 20% Ceramic Capacitor [Digikey: 490-5528-1-ND or 399-5508-1-ND or 445-6010-1-ND]&lt;/li&gt;
&lt;li&gt;100uF 6.3V -20%, +80% Y5V Ceramic Capacitor (Digikey: 490-4512-1-ND, Mouser: 81-GRM31CF50J107ZE1L)&lt;/li&gt;
&lt;/ul&gt;</description>
<gates>
<gate name="G$1" symbol="CAPACITOR" x="0" y="-2.54"/>
</gates>
<devices>
<device name="0805" package="0805">
<connects>
<connect gate="G$1" pin="P$1" pad="1"/>
<connect gate="G$1" pin="P$2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="1206" package="1206">
<connects>
<connect gate="G$1" pin="P$1" pad="1"/>
<connect gate="G$1" pin="P$2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0603" package="0603">
<connects>
<connect gate="G$1" pin="P$1" pad="1"/>
<connect gate="G$1" pin="P$2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0402" package="0402">
<connects>
<connect gate="G$1" pin="P$1" pad="1"/>
<connect gate="G$1" pin="P$2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0603MINI" package="0603-MINI">
<connects>
<connect gate="G$1" pin="P$1" pad="1"/>
<connect gate="G$1" pin="P$2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0805-NOTHERMALS" package="0805_NOTHERMALS">
<connects>
<connect gate="G$1" pin="P$1" pad="1"/>
<connect gate="G$1" pin="P$2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_0402" package="_0402">
<connects>
<connect gate="G$1" pin="P$1" pad="1"/>
<connect gate="G$1" pin="P$2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_0402MP" package="_0402MP">
<connects>
<connect gate="G$1" pin="P$1" pad="1"/>
<connect gate="G$1" pin="P$2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_0603" package="_0603">
<connects>
<connect gate="G$1" pin="P$1" pad="1"/>
<connect gate="G$1" pin="P$2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_0603MP" package="_0603MP">
<connects>
<connect gate="G$1" pin="P$1" pad="1"/>
<connect gate="G$1" pin="P$2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_0805" package="_0805">
<connects>
<connect gate="G$1" pin="P$1" pad="1"/>
<connect gate="G$1" pin="P$2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_0805MP" package="_0805MP">
<connects>
<connect gate="G$1" pin="P$1" pad="1"/>
<connect gate="G$1" pin="P$2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="GND">
<description>&lt;b&gt;GND&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="GND" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="RESISTOR" prefix="R" uservalue="yes">
<description>&lt;p&gt;&lt;b&gt;Resistors&lt;/b&gt;&lt;/p&gt;
&lt;b&gt;0402&lt;/b&gt; - 0402 Surface Mount Package
&lt;ul&gt;
&lt;li&gt;22 Ohm 1% 1/16W [Digikey: 311-22.0LRTR-ND]&lt;/li&gt;
&lt;li&gt;33 Ohm 5% 1/16W&lt;/li&gt;
&lt;li&gt;1.0K 5% 1/16W&lt;/li&gt;
&lt;li&gt;1.5K 5% 1/16W&lt;/li&gt;
&lt;li&gt;2.0K 1% 1/16W&lt;/li&gt;
&lt;li&gt;10.0K 1% 1/16W [Digikey: 311-10.0KLRTR-ND]&lt;/li&gt;
&lt;li&gt;10.0K 5% 1/16W [Digikey: RMCF0402JT10K0TR-ND]&lt;/li&gt;
&lt;li&gt;12.1K 1% 1/16W [Digikey: 311-22.0LRTR-ND]&lt;/li&gt;
&lt;li&gt;100.0K 5% 1/16W&lt;/li&gt;
&lt;/ul&gt;
&lt;b&gt;0603&lt;/b&gt; - 0603 Surface Mount Package&lt;br&gt;
&lt;ul&gt;
&lt;li&gt;0 Ohm 1/10 Watt 1% Resistor&lt;/li&gt;
&lt;li&gt;15 Ohm 1/10 Watt 1% Resistor&lt;/li&gt;
&lt;li&gt;33 Ohm 1/10 Watt 1% Resistor&lt;/li&gt;
&lt;li&gt;49.9 Ohm 1/10 Watt 1% Resistor&lt;/li&gt;
&lt;li&gt;100 Ohm 1/10 Watt 1% Resistor&lt;/li&gt;
&lt;li&gt;150 Ohm 1/10 Watt 1% Resistor&lt;/li&gt;
&lt;li&gt;240 Ohm 1/10 Watt 1% Resistor&lt;/li&gt;
&lt;li&gt;390 Ohm 1/10 Watt 1% Resistor&lt;/li&gt;
&lt;li&gt;560 Ohm 1/10 Watt 1% Resistor&lt;/li&gt;
&lt;li&gt;680 Ohm 1/10 Watt 1% Resistor&lt;/li&gt;
&lt;li&gt;750 Ohm 1/10 Watt 1% Resistor&lt;/li&gt;
&lt;li&gt;1.0K Ohm 1/10 Watt 1% Resistor&lt;/li&gt;
&lt;li&gt;1.5K Ohm 1/10 Watt 1% Resistor&lt;/li&gt;
&lt;li&gt;2.0K Ohm 1/10 Watt 1% Resistor&lt;/li&gt;
&lt;li&gt;2.2K Ohm 1/10 Watt 1% Resistor&lt;/li&gt;
&lt;li&gt;3.3K Ohm 1/10 Watt 1% Resistor&lt;/li&gt;
&lt;li&gt;4.7K Ohm 1/10 Watt 1% Resistor&lt;/li&gt;
&lt;li&gt;10.0K Ohm 1/10 Watt 1% Resistor&lt;/li&gt;
&lt;li&gt;12.0K Ohm 1/10 Watt 1% Resistor&lt;/li&gt;
&lt;li&gt;12.1K Ohm 1/10 Watt 1% Resistor&lt;/li&gt;
&lt;li&gt;20.0K Ohm 1/10 Watt 1% Resistor&lt;/li&gt;
&lt;li&gt;33.0K Ohm 1/10 Watt 1% Resistor&lt;/li&gt;
&lt;li&gt;100.0K Ohm 1/10 Watt 1% Resistor&lt;/li&gt;
&lt;/ul&gt;
&lt;b&gt;0805&lt;/b&gt; - 0805 Surface Mount Package
&lt;ul&gt;
&lt;li&gt;0 Ohm 1/8 Watt 1% Resistor&lt;/li&gt;
&lt;li&gt;33 Ohm 1/8 Watt 1% Resistor&lt;/li&gt;
&lt;li&gt;100 Ohm 1/8 Watt 1% Resistor&lt;/li&gt;
&lt;li&gt;150 Ohm 1/8 Watt 1% Resistor&lt;/li&gt;
&lt;li&gt;200 Ohm 1/8 Watt 1% Resistor&lt;/li&gt;
&lt;li&gt;240 Ohm 1/8 Watt 1% Resistor&lt;/li&gt;
&lt;li&gt;330 Ohm 1/8 Watt 1% Resistor&lt;/li&gt;
&lt;li&gt;390 Ohm 1/8 Watt 1% Resistor&lt;/li&gt;
&lt;li&gt;470 Ohm 1/8 Watt 1% Resistor&lt;/li&gt;
&lt;li&gt;1.0K Ohm 1/8 Watt 1% Resistor&lt;/li&gt;
&lt;li&gt;1.5K Ohm 1/8 Watt 1% Resistor&lt;/li&gt;
&lt;li&gt;2.0K Ohm 1/8 Watt 1% Resistor&lt;/li&gt;
&lt;li&gt;4.7K Ohm 1/8 Watt 1% Resistor&lt;/li&gt;
&lt;li&gt;5.1K Ohm 1/8 Watt 1% Resistor&lt;/li&gt;
&lt;li&gt;5.6K Ohm 1/8 Watt 1% Resistor&lt;/li&gt;
&lt;li&gt;10.0K Ohm 1/8 Watt 1% Resistor&lt;/li&gt;
&lt;li&gt;22.0K Ohm 1/8 Watt 1% Resistor&lt;/li&gt;
&lt;li&gt;33.0K Ohm 1/8 Watt 1% Resistor&lt;/li&gt;
&lt;li&gt;100K Ohm 1/8 Watt 1% Resistor&lt;/li&gt;
&lt;/ul&gt;
&lt;b&gt;1206&lt;/b&gt; - 1206 Surface Mount Package&lt;br/&gt;
&lt;br/&gt;
&lt;b&gt;2012&lt;/b&gt; - 2010 Surface Mount Package&lt;br/&gt;
&lt;ul&gt;&lt;li&gt;0.11 Ohm 1/2 Watt 1% Resistor - Digikey: RHM.11UCT-ND&lt;/li&gt;&lt;/ul&gt;</description>
<gates>
<gate name="G$1" symbol="RESISTOR" x="0" y="0"/>
</gates>
<devices>
<device name="0805" package="0805">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="1206" package="1206">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0603" package="0603">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0402" package="0402">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0603MINI" package="0603-MINI">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="2012" package="2012">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0805_NOTHERMALS" package="0805_NOTHERMALS">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="2512" package="2512">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_0402" package="_0402">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_0402MP" package="_0402MP">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_0603" package="_0603">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_0603MP" package="_0603MP">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_0805" package="_0805">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_0805MP" package="_0805MP">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="SteveMarple">
<packages>
<package name="PAD">
<pad name="1" x="0" y="0" drill="1.016" diameter="1.8796"/>
</package>
</packages>
<symbols>
<symbol name="PAD">
<pin name="1" x="0" y="0" visible="off" length="point"/>
<circle x="0" y="0" radius="0.762" width="0.254" layer="94"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="PAD">
<gates>
<gate name="G$1" symbol="PAD" x="0" y="0"/>
</gates>
<devices>
<device name="" package="PAD">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="Misc_HEXFET_Transistors">
<packages>
<package name="SO08">
<description>&lt;b&gt;Small Outline Package&lt;/b&gt; Fits JEDEC packages (narrow SOIC-8)</description>
<wire x1="-2.362" y1="-1.803" x2="2.362" y2="-1.803" width="0.1524" layer="51"/>
<wire x1="2.362" y1="-1.803" x2="2.362" y2="1.803" width="0.1524" layer="21"/>
<wire x1="2.362" y1="1.803" x2="-2.362" y2="1.803" width="0.1524" layer="51"/>
<wire x1="-2.362" y1="1.803" x2="-2.362" y2="-1.803" width="0.1524" layer="21"/>
<circle x="-1.8034" y="-0.9906" radius="0.1436" width="0.2032" layer="21"/>
<smd name="1" x="-1.905" y="-2.6162" dx="0.6096" dy="2.2098" layer="1"/>
<smd name="2" x="-0.635" y="-2.6162" dx="0.6096" dy="2.2098" layer="1"/>
<smd name="3" x="0.635" y="-2.6162" dx="0.6096" dy="2.2098" layer="1"/>
<smd name="4" x="1.905" y="-2.6162" dx="0.6096" dy="2.2098" layer="1"/>
<smd name="5" x="1.905" y="2.6162" dx="0.6096" dy="2.2098" layer="1"/>
<smd name="6" x="0.635" y="2.6162" dx="0.6096" dy="2.2098" layer="1"/>
<smd name="7" x="-0.635" y="2.6162" dx="0.6096" dy="2.2098" layer="1"/>
<smd name="8" x="-1.905" y="2.6162" dx="0.6096" dy="2.2098" layer="1"/>
<text x="-1.27" y="-0.635" size="0.4064" layer="27">&gt;VALUE</text>
<text x="-1.27" y="0" size="0.4064" layer="25">&gt;NAME</text>
<rectangle x1="-2.0828" y1="-2.8702" x2="-1.7272" y2="-1.8542" layer="51"/>
<rectangle x1="-0.8128" y1="-2.8702" x2="-0.4572" y2="-1.8542" layer="51"/>
<rectangle x1="0.4572" y1="-2.8702" x2="0.8128" y2="-1.8542" layer="51"/>
<rectangle x1="1.7272" y1="-2.8702" x2="2.0828" y2="-1.8542" layer="51"/>
<rectangle x1="-2.0828" y1="1.8542" x2="-1.7272" y2="2.8702" layer="51"/>
<rectangle x1="-0.8128" y1="1.8542" x2="-0.4572" y2="2.8702" layer="51"/>
<rectangle x1="0.4572" y1="1.8542" x2="0.8128" y2="2.8702" layer="51"/>
<rectangle x1="1.7272" y1="1.8542" x2="2.0828" y2="2.8702" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="N-MOSFET-SO8-DUAL">
<wire x1="-1.143" y1="3.302" x2="-1.143" y2="1.778" width="0.254" layer="94"/>
<wire x1="-1.143" y1="6.223" x2="-1.143" y2="3.937" width="0.254" layer="94"/>
<wire x1="-1.143" y1="1.143" x2="-1.143" y2="-1.143" width="0.254" layer="94"/>
<wire x1="-2.286" y1="5.08" x2="-2.286" y2="0" width="0.254" layer="94"/>
<wire x1="1.905" y1="3.302" x2="3.175" y2="3.302" width="0.1524" layer="94"/>
<wire x1="1.905" y1="3.302" x2="1.651" y2="3.048" width="0.1524" layer="94"/>
<wire x1="3.175" y1="3.302" x2="3.429" y2="3.556" width="0.1524" layer="94"/>
<wire x1="2.54" y1="5.08" x2="2.54" y2="0" width="0.1524" layer="94"/>
<wire x1="-1.016" y1="0" x2="1.016" y2="0" width="0.1524" layer="94"/>
<wire x1="1.016" y1="0" x2="2.54" y2="0" width="0.1524" layer="94"/>
<wire x1="2.54" y1="5.08" x2="-1.016" y2="5.08" width="0.1524" layer="94"/>
<wire x1="-1.016" y1="2.54" x2="1.016" y2="2.54" width="0.1524" layer="94"/>
<wire x1="1.016" y1="2.54" x2="1.016" y2="0" width="0.1524" layer="94"/>
<wire x1="-2.286" y1="0" x2="-2.54" y2="0" width="0.1524" layer="94"/>
<wire x1="5.08" y1="5.08" x2="2.54" y2="5.08" width="0.254" layer="94"/>
<circle x="0" y="2.54" radius="4.318" width="0.1524" layer="94"/>
<text x="-4.572" y="5.08" size="1.778" layer="96" rot="R180">&gt;VALUE</text>
<text x="-4.572" y="7.62" size="1.778" layer="95" rot="R180">&gt;NAME</text>
<pin name="G" x="-5.08" y="0" visible="pad" length="short" direction="in"/>
<pin name="S" x="2.54" y="-2.54" visible="pad" length="short" rot="R90"/>
<pin name="D@1" x="2.54" y="7.62" visible="pad" length="short" swaplevel="1" rot="R270"/>
<pin name="D@2" x="5.08" y="7.62" visible="pad" length="short" swaplevel="1" rot="R270"/>
<polygon width="0.1524" layer="94">
<vertex x="2.54" y="3.175"/>
<vertex x="1.905" y="1.905"/>
<vertex x="3.175" y="1.905"/>
</polygon>
<polygon width="0.1524" layer="94">
<vertex x="-0.889" y="2.54"/>
<vertex x="0.381" y="3.175"/>
<vertex x="0.381" y="1.905"/>
</polygon>
</symbol>
</symbols>
<devicesets>
<deviceset name="IRF8313">
<description>&lt;p&gt;Dual N-Channel HEXFET® Power MOSFET&lt;/p&gt;
&lt;b&gt;Applications&lt;/b&gt;
&lt;ul&gt;
&lt;li&gt;Load Switch&lt;/li&gt;
&lt;li&gt;DC/DC Converters&lt;/li&gt;
&lt;/ul&gt;
&lt;b&gt;Benefits&lt;/b&gt;
&lt;ul&gt;
&lt;li&gt;Low Gate Charge and Low RDS(on)&lt;/li&gt;
&lt;li&gt;Fully Characterized Avalanche Voltage and Current&lt;/li&gt;
&lt;li&gt;20V VGS Max. Gate Rating&lt;/li&gt;
&lt;li&gt;100% Tested for RG&lt;/li&gt;
&lt;li&gt;Lead-Free (Qualified to 260°C Reflow)&lt;/li&gt;
&lt;li&gt;RoHS Compliant (Halogen Free)&lt;/li&gt;
&lt;/ul&gt;
&lt;dl&gt;
&lt;dt&gt;R&lt;sub&gt;DS(ON)&lt;/sub&gt;&lt;/dt&gt;
&lt;dd&gt;12.5m&amp;#937; @V&lt;sub&gt;GS&lt;/sub&gt; = 10V&lt;br&gt;
18.6m&amp;#937; @V&lt;sub&gt;GS&lt;/sub&gt; = 4.5V&lt;/dd&gt;
&lt;/dl&gt;
&lt;dl&gt;
&lt;dt&gt;Maximum Ratings&lt;/dt&gt;
&lt;dd&gt;
V&lt;sub&gt;GS&lt;/sub&gt; = 20V&lt;br&gt;
V&lt;sub&gt;DS&lt;/sub&gt; = 30V&lt;br&gt;
I&lt;sub&gt;DS&lt;/sub&gt; = 9.7A
&lt;/dd&gt;
&lt;/dl&gt;</description>
<gates>
<gate name="G$1" symbol="N-MOSFET-SO8-DUAL" x="-7.62" y="-2.54" swaplevel="1"/>
<gate name="G$2" symbol="N-MOSFET-SO8-DUAL" x="12.7" y="-2.54" swaplevel="1"/>
</gates>
<devices>
<device name="" package="SO08">
<connects>
<connect gate="G$1" pin="D@1" pad="6"/>
<connect gate="G$1" pin="D@2" pad="5"/>
<connect gate="G$1" pin="G" pad="4"/>
<connect gate="G$1" pin="S" pad="3"/>
<connect gate="G$2" pin="D@1" pad="8"/>
<connect gate="G$2" pin="D@2" pad="7"/>
<connect gate="G$2" pin="G" pad="2"/>
<connect gate="G$2" pin="S" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="jumper">
<description>&lt;b&gt;Jumpers&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="05">
<description>&lt;b&gt;JUMPER&lt;/b&gt;</description>
<wire x1="-1.3462" y1="0" x2="1.3462" y2="0" width="0.6096" layer="21"/>
<wire x1="2.54" y1="0" x2="1.397" y2="0" width="0.6096" layer="51"/>
<wire x1="-2.54" y1="0" x2="-1.397" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-2.54" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<text x="-2.54" y="0.889" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="2.5001" y="0" size="0.02" layer="27">&gt;VALUE</text>
</package>
<package name="07">
<description>&lt;b&gt;JUMPER&lt;/b&gt;</description>
<wire x1="-2.6162" y1="0" x2="2.6162" y2="0" width="0.6096" layer="21"/>
<wire x1="3.81" y1="0" x2="2.54" y2="0" width="0.6096" layer="51"/>
<wire x1="-3.81" y1="0" x2="-2.54" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-3.81" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<pad name="2" x="3.81" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<text x="-2.54" y="0.635" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="3.7" y="0" size="0.02" layer="27">&gt;VALUE</text>
</package>
<package name="10">
<description>&lt;b&gt;JUMPER&lt;/b&gt;</description>
<wire x1="-3.8862" y1="0" x2="3.8862" y2="0" width="0.6096" layer="21"/>
<wire x1="5.08" y1="0" x2="3.937" y2="0" width="0.6096" layer="51"/>
<wire x1="-5.08" y1="0" x2="-3.937" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-5.08" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<pad name="2" x="5.08" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<text x="-3.175" y="0.635" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="5" y="0" size="0.02" layer="27">&gt;VALUE</text>
</package>
<package name="12">
<description>&lt;b&gt;JUMPER&lt;/b&gt;</description>
<wire x1="-5.1562" y1="0" x2="5.1562" y2="0" width="0.6096" layer="21"/>
<wire x1="6.35" y1="0" x2="5.207" y2="0" width="0.6096" layer="51"/>
<wire x1="-6.35" y1="0" x2="-5.207" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-6.35" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<pad name="2" x="6.35" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<text x="-3.175" y="0.635" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="6.3" y="0" size="0.02" layer="27">&gt;VALUE</text>
</package>
<package name="15">
<description>&lt;b&gt;JUMPER&lt;/b&gt;</description>
<wire x1="-6.4262" y1="0" x2="6.4262" y2="0" width="0.6096" layer="21"/>
<wire x1="7.62" y1="0" x2="6.477" y2="0" width="0.6096" layer="51"/>
<wire x1="-7.62" y1="0" x2="-6.477" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-7.62" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<pad name="2" x="7.62" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<text x="-5.715" y="0.635" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="7.5999" y="0" size="0.02" layer="27">&gt;VALUE</text>
</package>
<package name="20">
<description>&lt;b&gt;JUMPER&lt;/b&gt;</description>
<wire x1="-8.9662" y1="0" x2="8.9662" y2="0" width="0.6096" layer="21"/>
<wire x1="10.16" y1="0" x2="9.017" y2="0" width="0.6096" layer="51"/>
<wire x1="-10.16" y1="0" x2="-9.017" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-10.16" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<pad name="2" x="10.16" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<text x="-8.255" y="0.635" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="10.1001" y="0" size="0.02" layer="27">&gt;VALUE</text>
</package>
<package name="25">
<description>&lt;b&gt;JUMPER&lt;/b&gt;</description>
<wire x1="-11.5062" y1="0" x2="11.5062" y2="0" width="0.6096" layer="21"/>
<wire x1="12.7" y1="0" x2="11.557" y2="0" width="0.6096" layer="51"/>
<wire x1="-12.7" y1="0" x2="-11.557" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-12.7" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<pad name="2" x="12.7" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<text x="-10.795" y="0.635" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="12.5999" y="0" size="0.02" layer="27">&gt;VALUE</text>
</package>
<package name="30">
<description>&lt;b&gt;JUMPER&lt;/b&gt;</description>
<wire x1="-14.0462" y1="0" x2="14.0462" y2="0" width="0.6096" layer="21"/>
<wire x1="15.24" y1="0" x2="14.097" y2="0" width="0.6096" layer="51"/>
<wire x1="-15.24" y1="0" x2="-14.097" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-15.24" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<pad name="2" x="15.24" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<text x="-13.335" y="0.635" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="15.2001" y="0" size="0.02" layer="27">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="J">
<wire x1="-2.54" y1="0" x2="-1.27" y2="1.27" width="0.1524" layer="94"/>
<wire x1="-1.27" y1="1.27" x2="1.27" y2="1.27" width="0.1524" layer="94"/>
<wire x1="2.54" y1="0" x2="1.27" y2="1.27" width="0.1524" layer="94"/>
<circle x="-2.54" y="0" radius="0.254" width="0.4064" layer="94"/>
<circle x="2.54" y="0" radius="0.254" width="0.4064" layer="94"/>
<text x="-2.54" y="1.905" size="1.778" layer="95">&gt;NAME</text>
<text x="-2.54" y="-2.54" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-5.08" y="0" visible="pad" length="short" direction="pas" swaplevel="1"/>
<pin name="2" x="5.08" y="0" visible="pad" length="short" direction="pas" swaplevel="1" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="J" prefix="J">
<description>Bridge</description>
<gates>
<gate name="1" symbol="J" x="0" y="0"/>
</gates>
<devices>
<device name="5MM" package="05">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="7MM" package="07">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="10MM" package="10">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="12MM" package="12">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="15MM" package="15">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="20MM" package="20">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="25MM" package="25">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="30MM" package="30">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="linear">
<description>&lt;b&gt;Linear Devices&lt;/b&gt;&lt;p&gt;
Operational amplifiers,  comparators, voltage regulators, ADCs, DACs, etc.&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="SOT89">
<description>&lt;b&gt;SOT98&lt;/b&gt; PK (R-PDSO-G3)&lt;p&gt;
Source: http://focus.ti.com/lit/ds/symlink/ua78l05.pdf</description>
<wire x1="2.235" y1="-1.245" x2="-2.235" y2="-1.245" width="0.127" layer="51"/>
<wire x1="2.235" y1="1.219" x2="2.235" y2="-1.245" width="0.127" layer="21"/>
<wire x1="-2.235" y1="-1.245" x2="-2.235" y2="1.219" width="0.127" layer="21"/>
<wire x1="-2.235" y1="1.219" x2="2.235" y2="1.219" width="0.127" layer="51"/>
<wire x1="-0.7874" y1="1.5748" x2="-0.3556" y2="2.0066" width="0.1998" layer="51"/>
<wire x1="-0.3556" y1="2.0066" x2="0.3556" y2="2.0066" width="0.1998" layer="51"/>
<wire x1="0.3556" y1="2.0066" x2="0.7874" y2="1.5748" width="0.1998" layer="51"/>
<wire x1="0.7874" y1="1.5748" x2="0.7874" y2="1.2954" width="0.1998" layer="51"/>
<wire x1="0.7874" y1="1.2954" x2="-0.7874" y2="1.2954" width="0.1998" layer="51"/>
<wire x1="-0.7874" y1="1.2954" x2="-0.7874" y2="1.5748" width="0.1998" layer="51"/>
<smd name="1" x="-1.499" y="-1.981" dx="1" dy="1.5" layer="1" stop="no" cream="no"/>
<smd name="3" x="1.499" y="-1.981" dx="1" dy="1.5" layer="1" stop="no" cream="no"/>
<smd name="2" x="0" y="-1.727" dx="1" dy="2" layer="1" stop="no" cream="no"/>
<smd name="2@1" x="0" y="0.94" dx="2.2" dy="3.7" layer="1" roundness="100" cream="no"/>
<text x="-2.54" y="3.175" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.4051" y="-4.3449" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.7272" y1="-2.1082" x2="-1.27" y2="-1.27" layer="51"/>
<rectangle x1="1.27" y1="-2.1082" x2="1.7272" y2="-1.27" layer="51"/>
<rectangle x1="-0.2794" y1="-2.1082" x2="0.2794" y2="-1.27" layer="51"/>
<rectangle x1="-0.4" y1="-2.68" x2="0.4" y2="-1.28" layer="31"/>
<rectangle x1="-2.025" y1="-2.775" x2="-0.975" y2="-1.2" layer="29"/>
<rectangle x1="0.975" y1="-2.775" x2="2.025" y2="-1.2" layer="29"/>
<rectangle x1="-0.525" y1="-2.775" x2="0.525" y2="-1.2" layer="29"/>
<rectangle x1="1.1" y1="-2.68" x2="1.9" y2="-1.28" layer="31"/>
<rectangle x1="-1.9" y1="-2.68" x2="-1.1" y2="-1.28" layer="31"/>
<rectangle x1="-0.9" y1="0" x2="0.9" y2="2.2" layer="31"/>
<polygon width="0.1998" layer="51">
<vertex x="-0.7874" y="1.3208"/>
<vertex x="-0.7874" y="1.5748"/>
<vertex x="-0.3556" y="2.0066"/>
<vertex x="0.3048" y="2.0066"/>
<vertex x="0.3556" y="2.0066"/>
<vertex x="0.7874" y="1.5748"/>
<vertex x="0.7874" y="1.2954"/>
<vertex x="-0.7874" y="1.2954"/>
</polygon>
</package>
<package name="DIL08">
<description>&lt;b&gt;Dual In Line Package&lt;/b&gt;</description>
<wire x1="5.08" y1="2.921" x2="-5.08" y2="2.921" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-2.921" x2="5.08" y2="-2.921" width="0.1524" layer="21"/>
<wire x1="5.08" y1="2.921" x2="5.08" y2="-2.921" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="2.921" x2="-5.08" y2="1.016" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-2.921" x2="-5.08" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="1.016" x2="-5.08" y2="-1.016" width="0.1524" layer="21" curve="-180"/>
<pad name="1" x="-3.81" y="-3.81" drill="0.8128" diameter="1.27" rot="R90"/>
<pad name="2" x="-1.27" y="-3.81" drill="0.8128" diameter="1.27" rot="R90"/>
<pad name="7" x="-1.27" y="3.81" drill="0.8128" diameter="1.27" rot="R90"/>
<pad name="8" x="-3.81" y="3.81" drill="0.8128" diameter="1.27" rot="R90"/>
<pad name="3" x="1.27" y="-3.81" drill="0.8128" diameter="1.27" rot="R90"/>
<pad name="4" x="3.81" y="-3.81" drill="0.8128" diameter="1.27" rot="R90"/>
<pad name="6" x="1.27" y="3.81" drill="0.8128" diameter="1.27" rot="R90"/>
<pad name="5" x="3.81" y="3.81" drill="0.8128" diameter="1.27" rot="R90"/>
<text x="-5.334" y="-2.921" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="-3.556" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="SOT23-5">
<description>&lt;b&gt;Small Outline Transistor&lt;/b&gt;, 5 lead</description>
<wire x1="-1.544" y1="0.713" x2="1.544" y2="0.713" width="0.1524" layer="51"/>
<wire x1="1.544" y1="0.713" x2="1.544" y2="-0.712" width="0.1524" layer="21"/>
<wire x1="1.544" y1="-0.712" x2="-1.544" y2="-0.712" width="0.1524" layer="51"/>
<wire x1="-1.544" y1="-0.712" x2="-1.544" y2="0.713" width="0.1524" layer="21"/>
<smd name="5" x="-0.95" y="1.306" dx="0.6" dy="1.2" layer="1"/>
<smd name="4" x="0.95" y="1.306" dx="0.6" dy="1.2" layer="1"/>
<smd name="1" x="-0.95" y="-1.306" dx="0.6" dy="1.2" layer="1"/>
<smd name="2" x="0" y="-1.306" dx="0.6" dy="1.2" layer="1"/>
<smd name="3" x="0.95" y="-1.306" dx="0.6" dy="1.2" layer="1"/>
<text x="-1.778" y="-1.778" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="3.048" y="-1.778" size="1.27" layer="27" ratio="10" rot="R90">&gt;VALUE</text>
<rectangle x1="-1.1875" y1="0.7126" x2="-0.7125" y2="1.5439" layer="51"/>
<rectangle x1="0.7125" y1="0.7126" x2="1.1875" y2="1.5439" layer="51"/>
<rectangle x1="-1.1875" y1="-1.5437" x2="-0.7125" y2="-0.7124" layer="51"/>
<rectangle x1="-0.2375" y1="-1.5437" x2="0.2375" y2="-0.7124" layer="51"/>
<rectangle x1="0.7125" y1="-1.5437" x2="1.1875" y2="-0.7124" layer="51"/>
</package>
<package name="TSSOP8">
<description>&lt;b&gt;Thin Shrink Small Outline Plastic 8&lt;/b&gt; 3 x 4.4 mm&lt;p&gt;</description>
<wire x1="1.4" y1="-2.15" x2="1.4" y2="2.15" width="0.2032" layer="21"/>
<wire x1="1.4" y1="2.15" x2="-1.4" y2="2.15" width="0.2032" layer="21"/>
<wire x1="-1.4" y1="2.15" x2="-1.4" y2="-2.15" width="0.2032" layer="21"/>
<wire x1="-1.4" y1="-2.15" x2="1.4" y2="-2.15" width="0.2032" layer="21"/>
<circle x="-0.65" y="-1.625" radius="0.325" width="0" layer="21"/>
<smd name="1" x="-0.975" y="-2.925" dx="0.35" dy="1.2" layer="1"/>
<smd name="2" x="-0.325" y="-2.925" dx="0.35" dy="1.2" layer="1"/>
<smd name="3" x="0.325" y="-2.925" dx="0.35" dy="1.2" layer="1"/>
<smd name="4" x="0.975" y="-2.925" dx="0.35" dy="1.2" layer="1"/>
<smd name="5" x="0.975" y="2.925" dx="0.35" dy="1.2" layer="1"/>
<smd name="6" x="0.325" y="2.925" dx="0.35" dy="1.2" layer="1"/>
<smd name="7" x="-0.325" y="2.925" dx="0.35" dy="1.2" layer="1"/>
<smd name="8" x="-0.975" y="2.925" dx="0.35" dy="1.2" layer="1"/>
<text x="-1.625" y="-2.925" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="2.925" y="-3.25" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-1.1" y1="-3.2" x2="-0.85" y2="-2.2" layer="51"/>
<rectangle x1="-0.45" y1="-3.2" x2="-0.2" y2="-2.2" layer="51"/>
<rectangle x1="0.2" y1="-3.2" x2="0.45" y2="-2.2" layer="51"/>
<rectangle x1="0.85" y1="-3.2" x2="1.1" y2="-2.2" layer="51"/>
<rectangle x1="0.85" y1="2.2" x2="1.1" y2="3.2" layer="51"/>
<rectangle x1="0.2" y1="2.2" x2="0.45" y2="3.2" layer="51"/>
<rectangle x1="-0.45" y1="2.2" x2="-0.2" y2="3.2" layer="51"/>
<rectangle x1="-1.1" y1="2.2" x2="-0.85" y2="3.2" layer="51"/>
</package>
<package name="SO08">
<description>&lt;b&gt;Small Outline Package 8&lt;/b&gt;&lt;br&gt;
NS Package M08A</description>
<wire x1="2.4" y1="1.9" x2="2.4" y2="-1.4" width="0.2032" layer="51"/>
<wire x1="2.4" y1="-1.4" x2="2.4" y2="-1.9" width="0.2032" layer="51"/>
<wire x1="2.4" y1="-1.9" x2="-2.4" y2="-1.9" width="0.2032" layer="51"/>
<wire x1="-2.4" y1="-1.9" x2="-2.4" y2="-1.4" width="0.2032" layer="51"/>
<wire x1="-2.4" y1="-1.4" x2="-2.4" y2="1.9" width="0.2032" layer="51"/>
<wire x1="-2.4" y1="1.9" x2="2.4" y2="1.9" width="0.2032" layer="51"/>
<wire x1="2.4" y1="-1.4" x2="-2.4" y2="-1.4" width="0.2032" layer="51"/>
<smd name="2" x="-0.635" y="-2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="7" x="-0.635" y="2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="1" x="-1.905" y="-2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="3" x="0.635" y="-2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="4" x="1.905" y="-2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="8" x="-1.905" y="2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="6" x="0.635" y="2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="5" x="1.905" y="2.6" dx="0.6" dy="2.2" layer="1"/>
<text x="-2.667" y="-1.905" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="3.937" y="-1.905" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-2.15" y1="-3.1" x2="-1.66" y2="-2" layer="51"/>
<rectangle x1="-0.88" y1="-3.1" x2="-0.39" y2="-2" layer="51"/>
<rectangle x1="0.39" y1="-3.1" x2="0.88" y2="-2" layer="51"/>
<rectangle x1="1.66" y1="-3.1" x2="2.15" y2="-2" layer="51"/>
<rectangle x1="1.66" y1="2" x2="2.15" y2="3.1" layer="51"/>
<rectangle x1="0.39" y1="2" x2="0.88" y2="3.1" layer="51"/>
<rectangle x1="-0.88" y1="2" x2="-0.39" y2="3.1" layer="51"/>
<rectangle x1="-2.15" y1="2" x2="-1.66" y2="3.1" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="78XX2GND">
<wire x1="-5.08" y1="-5.08" x2="7.62" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="7.62" y1="-5.08" x2="7.62" y2="2.54" width="0.4064" layer="94"/>
<wire x1="7.62" y1="2.54" x2="-5.08" y2="2.54" width="0.4064" layer="94"/>
<wire x1="-5.08" y1="2.54" x2="-5.08" y2="-5.08" width="0.4064" layer="94"/>
<text x="-5.08" y="5.715" size="1.778" layer="95">&gt;NAME</text>
<text x="-5.08" y="3.175" size="1.778" layer="96">&gt;VALUE</text>
<text x="-1.27" y="-4.318" size="1.524" layer="95">GND</text>
<pin name="VI" x="-7.62" y="0" length="short" direction="in"/>
<pin name="GND" x="0" y="-7.62" visible="pad" length="short" direction="pas" rot="R90"/>
<pin name="VO" x="10.16" y="0" length="short" direction="pas" rot="R180"/>
<pin name="GND@1" x="2.54" y="-7.62" visible="off" length="short" direction="pas" rot="R90"/>
</symbol>
<symbol name="OPAMP+-">
<wire x1="-5.08" y1="5.08" x2="-5.08" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="-5.08" y1="-5.08" x2="5.08" y2="0" width="0.4064" layer="94"/>
<wire x1="5.08" y1="0" x2="-5.08" y2="5.08" width="0.4064" layer="94"/>
<wire x1="-3.81" y1="3.175" x2="-3.81" y2="1.905" width="0.1524" layer="94"/>
<wire x1="-4.445" y1="2.54" x2="-3.175" y2="2.54" width="0.1524" layer="94"/>
<wire x1="-4.445" y1="-2.54" x2="-3.175" y2="-2.54" width="0.1524" layer="94"/>
<text x="2.54" y="3.175" size="1.778" layer="95">&gt;NAME</text>
<text x="2.54" y="-5.08" size="1.778" layer="96">&gt;VALUE</text>
<text x="1.27" y="3.175" size="0.8128" layer="93" rot="R90">V+</text>
<text x="1.27" y="-4.445" size="0.8128" layer="93" rot="R90">V-</text>
<pin name="-IN" x="-7.62" y="-2.54" visible="pad" length="short" direction="in"/>
<pin name="+IN" x="-7.62" y="2.54" visible="pad" length="short" direction="in"/>
<pin name="OUT" x="7.62" y="0" visible="pad" length="short" direction="out" rot="R180"/>
<pin name="V+" x="0" y="7.62" visible="pad" length="middle" direction="pwr" rot="R270"/>
<pin name="V-" x="0" y="-7.62" visible="pad" length="middle" direction="pwr" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="78L*" prefix="IC">
<description>&lt;b&gt;POSITOIV-VOLTAGE REGULATORS&lt;/b&gt;&lt;p&gt;
Output up to 100 mA&lt;b&gt;
Source: http://focus.ti.com/lit/ds/symlink/ua78l05.pdf</description>
<gates>
<gate name="G$1" symbol="78XX2GND" x="0" y="0"/>
</gates>
<devices>
<device name="F" package="SOT89">
<connects>
<connect gate="G$1" pin="GND" pad="2"/>
<connect gate="G$1" pin="GND@1" pad="2@1"/>
<connect gate="G$1" pin="VI" pad="3"/>
<connect gate="G$1" pin="VO" pad="1"/>
</connects>
<technologies>
<technology name="05"/>
<technology name="08"/>
<technology name="09"/>
<technology name="10"/>
<technology name="12"/>
<technology name="15"/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="MCP601" prefix="IC">
<description>&lt;b&gt;Single Op Amp&lt;/b&gt; 2.7V to 6.0V Single Supply CMOS&lt;p&gt;
Source: http://ww1.microchip.com/downloads/en/DeviceDoc/21314g.pdf</description>
<gates>
<gate name="G$1" symbol="OPAMP+-" x="0" y="0"/>
</gates>
<devices>
<device name="P" package="DIL08">
<connects>
<connect gate="G$1" pin="+IN" pad="3"/>
<connect gate="G$1" pin="-IN" pad="2"/>
<connect gate="G$1" pin="OUT" pad="6"/>
<connect gate="G$1" pin="V+" pad="7"/>
<connect gate="G$1" pin="V-" pad="4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="OT" package="SOT23-5">
<connects>
<connect gate="G$1" pin="+IN" pad="3"/>
<connect gate="G$1" pin="-IN" pad="4"/>
<connect gate="G$1" pin="OUT" pad="1"/>
<connect gate="G$1" pin="V+" pad="5"/>
<connect gate="G$1" pin="V-" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="ST" package="TSSOP8">
<connects>
<connect gate="G$1" pin="+IN" pad="3"/>
<connect gate="G$1" pin="-IN" pad="2"/>
<connect gate="G$1" pin="OUT" pad="6"/>
<connect gate="G$1" pin="V+" pad="7"/>
<connect gate="G$1" pin="V-" pad="4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SN" package="SO08">
<connects>
<connect gate="G$1" pin="+IN" pad="3"/>
<connect gate="G$1" pin="-IN" pad="2"/>
<connect gate="G$1" pin="OUT" pad="6"/>
<connect gate="G$1" pin="V+" pad="7"/>
<connect gate="G$1" pin="V-" pad="4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R" package="SOT23-5">
<connects>
<connect gate="G$1" pin="+IN" pad="3"/>
<connect gate="G$1" pin="-IN" pad="4"/>
<connect gate="G$1" pin="OUT" pad="1"/>
<connect gate="G$1" pin="V+" pad="2"/>
<connect gate="G$1" pin="V-" pad="5"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="maplemini">
<description>STM32 Devices Library</description>
<packages>
<package name="40-DIP-BLUE-PIL">
<pad name="P$1" x="-7.62" y="22.86" drill="0.8" shape="square"/>
<pad name="P$2" x="-7.62" y="20.32" drill="0.8"/>
<pad name="P$3" x="-7.62" y="17.78" drill="0.8"/>
<pad name="P$4" x="-7.62" y="15.24" drill="0.8"/>
<pad name="P$5" x="-7.62" y="12.7" drill="0.8"/>
<pad name="P$6" x="-7.62" y="10.16" drill="0.8"/>
<pad name="P$7" x="-7.62" y="7.62" drill="0.8"/>
<pad name="P$8" x="-7.62" y="5.08" drill="0.8"/>
<pad name="P$9" x="-7.62" y="2.54" drill="0.8"/>
<pad name="P$10" x="-7.62" y="0" drill="0.8"/>
<pad name="P$11" x="-7.62" y="-2.54" drill="0.8"/>
<pad name="P$12" x="-7.62" y="-5.08" drill="0.8"/>
<pad name="P$13" x="-7.62" y="-7.62" drill="0.8"/>
<pad name="P$14" x="-7.62" y="-10.16" drill="0.8"/>
<pad name="P$15" x="-7.62" y="-12.7" drill="0.8"/>
<pad name="P$16" x="-7.62" y="-15.24" drill="0.8"/>
<pad name="P$17" x="-7.62" y="-17.78" drill="0.8"/>
<pad name="P$18" x="-7.62" y="-20.32" drill="0.8"/>
<pad name="P$19" x="-7.62" y="-22.86" drill="0.8"/>
<pad name="P$20" x="-7.62" y="-25.4" drill="0.8"/>
<pad name="P$21" x="7.62" y="-25.4" drill="0.8"/>
<pad name="P$22" x="7.62" y="-22.86" drill="0.8"/>
<pad name="P$23" x="7.62" y="-20.32" drill="0.8"/>
<pad name="P$24" x="7.62" y="-17.78" drill="0.8"/>
<pad name="P$25" x="7.62" y="-15.24" drill="0.8"/>
<pad name="P$26" x="7.62" y="-12.7" drill="0.8"/>
<pad name="P$27" x="7.62" y="-10.16" drill="0.8"/>
<pad name="P$28" x="7.62" y="-7.62" drill="0.8"/>
<pad name="P$29" x="7.62" y="-5.08" drill="0.8"/>
<pad name="P$30" x="7.62" y="-2.54" drill="0.8"/>
<pad name="P$31" x="7.62" y="0" drill="0.8"/>
<pad name="P$32" x="7.62" y="2.54" drill="0.8"/>
<pad name="P$33" x="7.62" y="5.08" drill="0.8"/>
<pad name="P$34" x="7.62" y="7.62" drill="0.8"/>
<pad name="P$35" x="7.62" y="10.16" drill="0.8"/>
<pad name="P$36" x="7.62" y="12.7" drill="0.8"/>
<pad name="P$37" x="7.62" y="15.24" drill="0.8"/>
<pad name="P$38" x="7.62" y="17.78" drill="0.8"/>
<pad name="P$39" x="7.62" y="20.32" drill="0.8"/>
<pad name="P$40" x="7.62" y="22.86" drill="0.8" shape="square"/>
<wire x1="-8.89" y1="-26.67" x2="8.89" y2="-26.67" width="0.127" layer="121"/>
<wire x1="8.89" y1="-26.67" x2="8.89" y2="24.13" width="0.127" layer="121"/>
<wire x1="8.89" y1="24.13" x2="-8.89" y2="24.13" width="0.127" layer="121"/>
<wire x1="-8.89" y1="24.13" x2="-8.89" y2="-26.67" width="0.127" layer="121"/>
<wire x1="-2.54" y1="-25.4" x2="2.54" y2="-25.4" width="0.127" layer="121"/>
<wire x1="2.54" y1="-25.4" x2="2.54" y2="-27.94" width="0.127" layer="121"/>
<wire x1="2.54" y1="-27.94" x2="-2.54" y2="-27.94" width="0.127" layer="121"/>
<wire x1="-2.54" y1="-27.94" x2="-2.54" y2="-25.4" width="0.127" layer="121"/>
</package>
</packages>
<symbols>
<symbol name="BLUEPILL">
<pin name="VBAT" x="-20.32" y="25.4" length="middle"/>
<pin name="PC13" x="-20.32" y="22.86" length="middle"/>
<pin name="PC14" x="-20.32" y="20.32" length="middle"/>
<pin name="PC15" x="-20.32" y="17.78" length="middle"/>
<pin name="PA0/A8" x="-20.32" y="15.24" length="middle"/>
<pin name="PA1/A7" x="-20.32" y="12.7" length="middle"/>
<pin name="PA2/A6/TX2" x="-20.32" y="10.16" length="middle"/>
<pin name="PA3/A5/RX2" x="-20.32" y="7.62" length="middle"/>
<pin name="PA4/A4/SS1" x="-20.32" y="5.08" length="middle"/>
<pin name="PA5/A3/SCK1" x="-20.32" y="2.54" length="middle"/>
<pin name="PA6/A2/MISO1" x="-20.32" y="0" length="middle"/>
<pin name="PA7/A1/M0SI1" x="-20.32" y="-2.54" length="middle"/>
<pin name="PB0/A0" x="-20.32" y="-5.08" length="middle"/>
<pin name="PB1" x="-20.32" y="-7.62" length="middle"/>
<pin name="PB10/TX3/SCL2" x="-20.32" y="-10.16" length="middle"/>
<pin name="PB11/RX3/SDA2" x="-20.32" y="-12.7" length="middle"/>
<pin name="RESET" x="-20.32" y="-15.24" length="middle"/>
<pin name="3V3" x="-20.32" y="-17.78" length="middle"/>
<pin name="GND/1" x="-20.32" y="-20.32" length="middle"/>
<pin name="GND/2" x="-20.32" y="-22.86" length="middle"/>
<pin name="PB12/SS2" x="22.86" y="-22.86" length="middle" rot="R180"/>
<pin name="PB13/SCK2" x="22.86" y="-20.32" length="middle" rot="R180"/>
<pin name="PB14/MIS02" x="22.86" y="-17.78" length="middle" rot="R180"/>
<pin name="PB15/MOSI2" x="22.86" y="-15.24" length="middle" rot="R180"/>
<pin name="PA8" x="22.86" y="-12.7" length="middle" rot="R180"/>
<pin name="PA9/TX1" x="22.86" y="-10.16" length="middle" rot="R180"/>
<pin name="PA10/RX1" x="22.86" y="-7.62" length="middle" rot="R180"/>
<pin name="PA11/USB-" x="22.86" y="-5.08" length="middle" rot="R180"/>
<pin name="PA12/USB+" x="22.86" y="-2.54" length="middle" rot="R180"/>
<pin name="PA15" x="22.86" y="0" length="middle" rot="R180"/>
<pin name="PB3" x="22.86" y="2.54" length="middle" rot="R180"/>
<pin name="PB4" x="22.86" y="5.08" length="middle" rot="R180"/>
<pin name="PB5" x="22.86" y="7.62" length="middle" rot="R180"/>
<pin name="PB6/SCL1" x="22.86" y="10.16" length="middle" rot="R180"/>
<pin name="PB7/SDA1" x="22.86" y="12.7" length="middle" rot="R180"/>
<pin name="PB8" x="22.86" y="15.24" length="middle" rot="R180"/>
<pin name="PB9" x="22.86" y="17.78" length="middle" rot="R180"/>
<pin name="5V" x="22.86" y="20.32" length="middle" rot="R180"/>
<pin name="GND/3" x="22.86" y="22.86" length="middle" rot="R180"/>
<pin name="3V3/1" x="22.86" y="25.4" length="middle" rot="R180"/>
<wire x1="-15.24" y1="27.94" x2="-15.24" y2="-25.4" width="0.254" layer="94"/>
<wire x1="-15.24" y1="-25.4" x2="17.78" y2="-25.4" width="0.254" layer="94"/>
<wire x1="17.78" y1="-25.4" x2="17.78" y2="27.94" width="0.254" layer="94"/>
<wire x1="17.78" y1="27.94" x2="-15.24" y2="27.94" width="0.254" layer="94"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="BLUEPILL">
<gates>
<gate name="G$1" symbol="BLUEPILL" x="-10.16" y="10.16"/>
</gates>
<devices>
<device name="" package="40-DIP-BLUE-PIL">
<connects>
<connect gate="G$1" pin="3V3" pad="P$18"/>
<connect gate="G$1" pin="3V3/1" pad="P$40"/>
<connect gate="G$1" pin="5V" pad="P$38"/>
<connect gate="G$1" pin="GND/1" pad="P$19"/>
<connect gate="G$1" pin="GND/2" pad="P$20"/>
<connect gate="G$1" pin="GND/3" pad="P$39"/>
<connect gate="G$1" pin="PA0/A8" pad="P$5"/>
<connect gate="G$1" pin="PA1/A7" pad="P$6"/>
<connect gate="G$1" pin="PA10/RX1" pad="P$27"/>
<connect gate="G$1" pin="PA11/USB-" pad="P$28"/>
<connect gate="G$1" pin="PA12/USB+" pad="P$29"/>
<connect gate="G$1" pin="PA15" pad="P$30"/>
<connect gate="G$1" pin="PA2/A6/TX2" pad="P$7"/>
<connect gate="G$1" pin="PA3/A5/RX2" pad="P$8"/>
<connect gate="G$1" pin="PA4/A4/SS1" pad="P$9"/>
<connect gate="G$1" pin="PA5/A3/SCK1" pad="P$10"/>
<connect gate="G$1" pin="PA6/A2/MISO1" pad="P$11"/>
<connect gate="G$1" pin="PA7/A1/M0SI1" pad="P$12"/>
<connect gate="G$1" pin="PA8" pad="P$25"/>
<connect gate="G$1" pin="PA9/TX1" pad="P$26"/>
<connect gate="G$1" pin="PB0/A0" pad="P$13"/>
<connect gate="G$1" pin="PB1" pad="P$14"/>
<connect gate="G$1" pin="PB10/TX3/SCL2" pad="P$15"/>
<connect gate="G$1" pin="PB11/RX3/SDA2" pad="P$16"/>
<connect gate="G$1" pin="PB12/SS2" pad="P$21"/>
<connect gate="G$1" pin="PB13/SCK2" pad="P$22"/>
<connect gate="G$1" pin="PB14/MIS02" pad="P$23"/>
<connect gate="G$1" pin="PB15/MOSI2" pad="P$24"/>
<connect gate="G$1" pin="PB3" pad="P$31"/>
<connect gate="G$1" pin="PB4" pad="P$32"/>
<connect gate="G$1" pin="PB5" pad="P$33"/>
<connect gate="G$1" pin="PB6/SCL1" pad="P$34"/>
<connect gate="G$1" pin="PB7/SDA1" pad="P$35"/>
<connect gate="G$1" pin="PB8" pad="P$36"/>
<connect gate="G$1" pin="PB9" pad="P$37"/>
<connect gate="G$1" pin="PC13" pad="P$2"/>
<connect gate="G$1" pin="PC14" pad="P$3"/>
<connect gate="G$1" pin="PC15" pad="P$4"/>
<connect gate="G$1" pin="RESET" pad="P$17"/>
<connect gate="G$1" pin="VBAT" pad="P$1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="adafruit[some parts from microbuilder.eu]">
<packages>
<package name="SMADIODE">
<description>&lt;b&gt;SMA Surface Mount Diode&lt;/b&gt;</description>
<wire x1="-2.15" y1="1.3" x2="2.15" y2="1.3" width="0.2032" layer="51"/>
<wire x1="2.15" y1="1.3" x2="2.15" y2="-1.3" width="0.2032" layer="51"/>
<wire x1="2.15" y1="-1.3" x2="-2.15" y2="-1.3" width="0.2032" layer="51"/>
<wire x1="-2.15" y1="-1.3" x2="-2.15" y2="1.3" width="0.2032" layer="51"/>
<wire x1="-3.789" y1="-1.394" x2="-3.789" y2="-1.146" width="0.127" layer="21"/>
<wire x1="-3.789" y1="-1.146" x2="-3.789" y2="1.6" width="0.127" layer="21"/>
<wire x1="-3.789" y1="1.6" x2="3.816" y2="1.6" width="0.127" layer="21"/>
<wire x1="3.816" y1="1.6" x2="3.816" y2="1.394" width="0.127" layer="21"/>
<wire x1="3.816" y1="1.394" x2="3.816" y2="1.3365" width="0.127" layer="21"/>
<wire x1="3.816" y1="1.394" x2="3.816" y2="-1.6" width="0.127" layer="21"/>
<wire x1="3.816" y1="-1.6" x2="-3.789" y2="-1.6" width="0.127" layer="21"/>
<wire x1="-3.789" y1="-1.6" x2="-3.789" y2="-1.146" width="0.127" layer="21"/>
<wire x1="-0.3175" y1="-0.4445" x2="-0.3175" y2="0.4445" width="0.127" layer="21"/>
<wire x1="-0.3175" y1="0.4445" x2="-0.6985" y2="0" width="0.127" layer="21"/>
<wire x1="-0.6985" y1="0" x2="-0.3175" y2="-0.4445" width="0.127" layer="21"/>
<wire x1="-0.6985" y1="-0.4445" x2="-0.6985" y2="0.4445" width="0.127" layer="21"/>
<smd name="C" x="-2.3495" y="0" dx="2.54" dy="2.54" layer="1"/>
<smd name="A" x="2.3495" y="0" dx="2.54" dy="2.54" layer="1" rot="R180"/>
<text x="-2.54" y="1.905" size="0.4064" layer="25" font="vector">&gt;NAME</text>
<text x="-2.54" y="-2.286" size="0.4064" layer="27" font="vector">&gt;VALUE</text>
<rectangle x1="-2.825" y1="-1.1" x2="-2.175" y2="1.1" layer="51"/>
<rectangle x1="2.175" y1="-1.1" x2="2.825" y2="1.1" layer="51" rot="R180"/>
<rectangle x1="-1.75" y1="-1.225" x2="-1.075" y2="1.225" layer="51"/>
</package>
<package name="DO-1N4148">
<wire x1="-2.54" y1="0.762" x2="2.54" y2="0.762" width="0.2032" layer="21"/>
<wire x1="2.54" y1="0.762" x2="2.54" y2="0" width="0.2032" layer="21"/>
<wire x1="2.54" y1="0" x2="2.54" y2="-0.762" width="0.2032" layer="21"/>
<wire x1="2.54" y1="-0.762" x2="-2.54" y2="-0.762" width="0.2032" layer="21"/>
<wire x1="-2.54" y1="-0.762" x2="-2.54" y2="0" width="0.2032" layer="21"/>
<wire x1="-2.54" y1="0" x2="-2.54" y2="0.762" width="0.2032" layer="21"/>
<wire x1="2.54" y1="0" x2="2.794" y2="0" width="0.2032" layer="21"/>
<wire x1="-2.54" y1="0" x2="-2.794" y2="0" width="0.2032" layer="21"/>
<wire x1="1.905" y1="0.635" x2="1.905" y2="-0.635" width="0.2032" layer="21"/>
<pad name="A" x="-3.81" y="0" drill="0.9"/>
<pad name="C" x="3.81" y="0" drill="0.9"/>
<text x="-2.54" y="1.27" size="0.4064" layer="25">&gt;Name</text>
<text x="-2.032" y="-0.254" size="0.6096" layer="21">&gt;Value</text>
</package>
<package name="SOT23-R">
<description>&lt;b&gt;SOT23&lt;/b&gt; - Reflow soldering</description>
<wire x1="1.5724" y1="0.6604" x2="1.5724" y2="-0.6604" width="0.1524" layer="51"/>
<wire x1="1.5724" y1="-0.6604" x2="-1.5724" y2="-0.6604" width="0.1524" layer="51"/>
<wire x1="-1.5724" y1="-0.6604" x2="-1.5724" y2="0.6604" width="0.1524" layer="51"/>
<wire x1="-1.5724" y1="0.6604" x2="1.5724" y2="0.6604" width="0.1524" layer="51"/>
<wire x1="-1.5724" y1="-0.6524" x2="-1.5724" y2="0.6604" width="0.1524" layer="21"/>
<wire x1="-1.5724" y1="0.6604" x2="-0.5136" y2="0.6604" width="0.1524" layer="21"/>
<wire x1="1.5724" y1="0.6604" x2="1.5724" y2="-0.6524" width="0.1524" layer="21"/>
<wire x1="0.5636" y1="0.6604" x2="1.5724" y2="0.6604" width="0.1524" layer="21"/>
<wire x1="0.4224" y1="-0.6604" x2="-0.4364" y2="-0.6604" width="0.1524" layer="21"/>
<smd name="3" x="0" y="1" dx="0.6" dy="0.7" layer="1"/>
<smd name="2" x="0.95" y="-1" dx="0.6" dy="0.7" layer="1"/>
<smd name="1" x="-0.95" y="-1" dx="0.6" dy="0.7" layer="1"/>
<text x="1.778" y="0.254" size="0.4064" layer="25">&gt;NAME</text>
<text x="1.778" y="-0.508" size="0.4064" layer="27">&gt;VALUE</text>
<rectangle x1="-0.2286" y1="0.7112" x2="0.2286" y2="1.2954" layer="51"/>
<rectangle x1="0.7112" y1="-1.2954" x2="1.1684" y2="-0.7112" layer="51"/>
<rectangle x1="-1.1684" y1="-1.2954" x2="-0.7112" y2="-0.7112" layer="51"/>
</package>
<package name="SOT23-W">
<description>&lt;b&gt;SOT23&lt;/b&gt; - Wave soldering</description>
<wire x1="1.5724" y1="0.6604" x2="1.5724" y2="-0.6604" width="0.1524" layer="51"/>
<wire x1="1.5724" y1="-0.6604" x2="-1.5724" y2="-0.6604" width="0.1524" layer="51"/>
<wire x1="-1.5724" y1="-0.6604" x2="-1.5724" y2="0.6604" width="0.1524" layer="51"/>
<wire x1="-1.5724" y1="0.6604" x2="1.5724" y2="0.6604" width="0.1524" layer="51"/>
<wire x1="-1.5724" y1="-0.3984" x2="-1.5724" y2="0.6604" width="0.1524" layer="21"/>
<wire x1="1.5724" y1="0.6604" x2="1.5724" y2="-0.3984" width="0.1524" layer="21"/>
<wire x1="0.2954" y1="-0.6604" x2="-0.3094" y2="-0.6604" width="0.1524" layer="21"/>
<smd name="3" x="0" y="1.3" dx="2.8" dy="1.4" layer="1"/>
<smd name="2" x="1.1" y="-1.3" dx="1.2" dy="1.4" layer="1"/>
<smd name="1" x="-1.1" y="-1.3" dx="1.2" dy="1.4" layer="1"/>
<text x="2.032" y="0.254" size="0.4064" layer="25">&gt;NAME</text>
<text x="2.032" y="-0.508" size="0.4064" layer="27">&gt;VALUE</text>
<rectangle x1="-0.2286" y1="0.7112" x2="0.2286" y2="1.2954" layer="51"/>
<rectangle x1="0.7112" y1="-1.2954" x2="1.1684" y2="-0.7112" layer="51"/>
<rectangle x1="-1.1684" y1="-1.2954" x2="-0.7112" y2="-0.7112" layer="51"/>
</package>
<package name="SOD-523">
<description>SOD-523 (0.8x1.2mm)

&lt;p&gt;Source: http://www.rohm.com/products/databook/di/pdf/rb751s-40.pdf&lt;/p&gt;</description>
<wire x1="-0.75" y1="1.5" x2="0.75" y2="1.5" width="0.127" layer="21"/>
<wire x1="0.75" y1="1.5" x2="0.75" y2="-1.5" width="0.127" layer="21"/>
<wire x1="0.75" y1="-1.5" x2="-0.75" y2="-1.5" width="0.127" layer="21"/>
<wire x1="-0.75" y1="-1.5" x2="-0.75" y2="1.5" width="0.127" layer="21"/>
<wire x1="1" y1="0.25" x2="1.5" y2="0.25" width="0.127" layer="51"/>
<wire x1="1.5" y1="0.25" x2="2" y2="0.25" width="0.127" layer="51"/>
<wire x1="1" y1="-0.25" x2="1.5" y2="-0.25" width="0.127" layer="51"/>
<wire x1="1.5" y1="-0.25" x2="2" y2="-0.25" width="0.127" layer="51"/>
<wire x1="2" y1="-0.25" x2="1.5" y2="0.25" width="0.127" layer="51"/>
<wire x1="1.5" y1="0.25" x2="1" y2="-0.25" width="0.127" layer="51"/>
<wire x1="1.5" y1="0.25" x2="1.5" y2="0.75" width="0.127" layer="51"/>
<wire x1="1.5" y1="-0.25" x2="1.5" y2="-0.75" width="0.127" layer="51"/>
<wire x1="-0.4445" y1="-0.1905" x2="0.4445" y2="-0.1905" width="0.127" layer="21"/>
<wire x1="0.4445" y1="-0.1905" x2="0" y2="0.1905" width="0.127" layer="21"/>
<wire x1="0" y1="0.1905" x2="-0.4445" y2="-0.1905" width="0.127" layer="21"/>
<wire x1="-0.4445" y1="0.1905" x2="0.4445" y2="0.1905" width="0.127" layer="21"/>
<smd name="K" x="0" y="0.8" dx="0.8" dy="0.6" layer="1"/>
<smd name="A" x="0" y="-0.8" dx="0.8" dy="0.6" layer="1"/>
<text x="1.016" y="1.016" size="0.4064" layer="25">&gt;NAME</text>
<text x="1.016" y="-1.524" size="0.4064" layer="27">&gt;VALUE</text>
<rectangle x1="-0.4" y1="-0.6" x2="0.4" y2="0.6" layer="51"/>
<rectangle x1="-0.15" y1="-0.8" x2="0.15" y2="-0.6" layer="51"/>
<rectangle x1="-0.15" y1="0.6" x2="0.15" y2="0.8" layer="51"/>
</package>
<package name="SOD-123">
<wire x1="-1" y1="0.7" x2="1" y2="0.7" width="0.1524" layer="51"/>
<wire x1="1" y1="0.7" x2="1" y2="-0.7" width="0.1524" layer="51"/>
<wire x1="1" y1="-0.7" x2="-1" y2="-0.7" width="0.1524" layer="51"/>
<wire x1="-1" y1="-0.7" x2="-1" y2="0.7" width="0.1524" layer="51"/>
<wire x1="-0.5" y1="0" x2="0.1" y2="0.4" width="0.1524" layer="51"/>
<wire x1="0.1" y1="0.4" x2="0.1" y2="-0.4" width="0.1524" layer="51"/>
<wire x1="0.1" y1="-0.4" x2="-0.5" y2="0" width="0.1524" layer="51"/>
<wire x1="-1.778" y1="0.762" x2="1.778" y2="0.762" width="0.127" layer="21"/>
<wire x1="1.778" y1="0.762" x2="1.778" y2="-0.762" width="0.127" layer="21"/>
<wire x1="1.778" y1="-0.762" x2="-1.778" y2="-0.762" width="0.127" layer="21"/>
<wire x1="-1.778" y1="-0.762" x2="-1.778" y2="0.762" width="0.127" layer="21"/>
<smd name="C" x="-1.85" y="0" dx="1.2" dy="0.7" layer="1"/>
<smd name="A" x="1.85" y="0" dx="1.2" dy="0.7" layer="1"/>
<text x="-1.1" y="1" size="0.4064" layer="25">&gt;NAME</text>
<text x="-1.1" y="-1.284" size="0.4064" layer="27">&gt;VALUE</text>
<rectangle x1="-0.7" y1="-0.7" x2="-0.5" y2="0.7" layer="51"/>
</package>
<package name="SOD-323F">
<wire x1="-0.85" y1="0.65" x2="0.85" y2="0.65" width="0.127" layer="21"/>
<wire x1="0.85" y1="0.65" x2="0.85" y2="-0.65" width="0.127" layer="21"/>
<wire x1="0.85" y1="-0.65" x2="-0.85" y2="-0.65" width="0.127" layer="21"/>
<wire x1="-0.85" y1="-0.65" x2="-0.85" y2="0.65" width="0.127" layer="21"/>
<wire x1="0.4" y1="0.6" x2="0.4" y2="-0.6" width="0.127" layer="21"/>
<wire x1="0.4" y1="-0.6" x2="0.3" y2="-0.6" width="0.127" layer="21"/>
<wire x1="0.3" y1="-0.6" x2="0.3" y2="0.6" width="0.127" layer="21"/>
<wire x1="-0.9" y1="0.2" x2="-1.2" y2="0.2" width="0.127" layer="51"/>
<wire x1="-1.2" y1="0.2" x2="-1.2" y2="-0.2" width="0.127" layer="51"/>
<wire x1="-1.2" y1="-0.2" x2="-0.9" y2="-0.2" width="0.127" layer="51"/>
<wire x1="0.9" y1="0.2" x2="1.2" y2="0.2" width="0.127" layer="51"/>
<wire x1="1.2" y1="0.2" x2="1.2" y2="-0.2" width="0.127" layer="51"/>
<wire x1="1.2" y1="-0.2" x2="0.9" y2="-0.2" width="0.127" layer="51"/>
<smd name="A" x="-1" y="0" dx="1" dy="0.8" layer="1"/>
<smd name="C" x="1" y="0" dx="1" dy="0.8" layer="1"/>
<text x="-1.8" y="0.9" size="0.8128" layer="25" font="vector">&gt;NAME</text>
<text x="-2.1" y="-1.7" size="0.8128" layer="27" font="vector">&gt;VALUE</text>
</package>
<package name="SOD-123FL">
<wire x1="-0.5" y1="0" x2="0.5" y2="0.4" width="0.1524" layer="21"/>
<wire x1="0.5" y1="0.4" x2="0.5" y2="-0.4" width="0.1524" layer="21"/>
<wire x1="0.5" y1="-0.4" x2="-0.5" y2="0" width="0.1524" layer="21"/>
<wire x1="-1.35" y1="0.825" x2="1.35" y2="0.825" width="0.127" layer="21"/>
<wire x1="1.35" y1="0.825" x2="1.35" y2="-0.825" width="0.127" layer="21"/>
<wire x1="1.35" y1="-0.825" x2="-1.35" y2="-0.825" width="0.127" layer="21"/>
<wire x1="-1.35" y1="-0.825" x2="-1.35" y2="0.825" width="0.127" layer="21"/>
<smd name="C" x="-1.6375" y="0" dx="0.91" dy="1.22" layer="1"/>
<smd name="A" x="1.6375" y="0" dx="0.91" dy="1.22" layer="1"/>
<text x="-1.1" y="1" size="0.4064" layer="25">&gt;NAME</text>
<text x="-1.1" y="-1.284" size="0.4064" layer="27">&gt;VALUE</text>
<rectangle x1="-0.7" y1="-0.7" x2="-0.5" y2="0.7" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="DIODE">
<wire x1="-1.27" y1="-1.27" x2="1.27" y2="0" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="-1.27" y2="1.27" width="0.254" layer="94"/>
<wire x1="1.27" y1="1.27" x2="1.27" y2="0" width="0.254" layer="94"/>
<wire x1="-1.27" y1="1.27" x2="-1.27" y2="-1.27" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="1.27" y2="-1.27" width="0.254" layer="94"/>
<text x="-2.54" y="2.54" size="1.27" layer="95">&gt;NAME</text>
<text x="-2.54" y="-3.81" size="1.27" layer="96">&gt;VALUE</text>
<pin name="A" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
<pin name="C" x="2.54" y="0" visible="off" length="short" direction="pas" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="DIODE" prefix="D" uservalue="yes">
<description>&lt;b&gt;Diode&lt;/b&gt;
&lt;p&gt;
&lt;b&gt;SMADIODE&lt;/b&gt; - SMA Surface Mount Package
&lt;ul&gt;
&lt;li&gt;20V 1A Schottky Diode Digikey: 641-1014-6-ND&lt;/li&gt;
&lt;/ul&gt;
&lt;b&gt;DO-1N4148&lt;/b&gt; - Through Hole Small Current Diode&lt;br&gt;
&lt;b&gt;SOD-123&lt;/b&gt;
&lt;ul&gt;
&lt;li&gt;20V 1 A (.5mV Vf) Schottky Diode - Digikey: MBRX120TPMSCT-ND&lt;/li&gt;
&lt;/ul&gt;
&lt;b&gt;SOD-323&lt;/b&gt;
&lt;ul&gt;
&lt;li&gt;10V 570mA (.38mV Vf, 3ns) Schottky Diode - Digikey: ZLLS410CT-ND&lt;/li&gt;
&lt;/ul&gt;
&lt;b&gt;SOD-523&lt;/b&gt;
&lt;ul&gt;
&lt;li&gt;30V 30mA Schottky Diode (RB751S-40TE61) - Digikey: RB751S-40TE61CT-ND&lt;/li&gt;
&lt;/ul&gt;
&lt;b&gt;SOT23-R/W&lt;/b&gt; - SOT23 Package (R = Solder Paste/Reflow Ovens, W = Hand-Soldering)
&lt;ul&gt;
&lt;li&gt;BAT54Film 40V 300mA - Digikey: 497-7162-1-ND&lt;/li&gt;
&lt;/ul&gt;
&lt;/p&gt;</description>
<gates>
<gate name="G$1" symbol="DIODE" x="0" y="0"/>
</gates>
<devices>
<device name="SMA" package="SMADIODE">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="DO-1N4148" package="DO-1N4148">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SOT23_REFLOW" package="SOT23-R">
<connects>
<connect gate="G$1" pin="A" pad="1"/>
<connect gate="G$1" pin="C" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SOT23_WAVE" package="SOT23-W">
<connects>
<connect gate="G$1" pin="A" pad="1"/>
<connect gate="G$1" pin="C" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SOD-523" package="SOD-523">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="K"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SOD-123" package="SOD-123">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SOD-323F" package="SOD-323F">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_SOD-123FL" package="SOD-123FL">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="Gele_v04">
<packages>
<package name="J5MM">
<description>&lt;b&gt;JUMPER&lt;/b&gt;</description>
<wire x1="-1.3462" y1="0" x2="1.3462" y2="0" width="0.6096" layer="21"/>
<wire x1="2.54" y1="0" x2="1.397" y2="0" width="0.6096" layer="51"/>
<wire x1="-2.54" y1="0" x2="-1.397" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-2.54" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<text x="-2.54" y="0.889" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="2.5001" y="0" size="0.02" layer="27">&gt;VALUE</text>
</package>
<package name="J7MM">
<description>&lt;b&gt;JUMPER&lt;/b&gt;</description>
<wire x1="-2.6162" y1="0" x2="2.6162" y2="0" width="0.6096" layer="21"/>
<wire x1="3.81" y1="0" x2="2.54" y2="0" width="0.6096" layer="51"/>
<wire x1="-3.81" y1="0" x2="-2.54" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-3.81" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<pad name="2" x="3.81" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<text x="-2.54" y="0.635" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="3.7" y="0" size="0.02" layer="27">&gt;VALUE</text>
</package>
<package name="J10MM">
<description>&lt;b&gt;JUMPER&lt;/b&gt;</description>
<wire x1="-3.8862" y1="0" x2="3.8862" y2="0" width="0.6096" layer="21"/>
<wire x1="5.08" y1="0" x2="3.937" y2="0" width="0.6096" layer="51"/>
<wire x1="-5.08" y1="0" x2="-3.937" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-5.08" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<pad name="2" x="5.08" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<text x="-3.175" y="0.635" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="5" y="0" size="0.02" layer="27">&gt;VALUE</text>
</package>
<package name="J12MM">
<description>&lt;b&gt;JUMPER&lt;/b&gt;</description>
<wire x1="-5.1562" y1="0" x2="5.1562" y2="0" width="0.6096" layer="21"/>
<wire x1="6.35" y1="0" x2="5.207" y2="0" width="0.6096" layer="51"/>
<wire x1="-6.35" y1="0" x2="-5.207" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-6.35" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<pad name="2" x="6.35" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<text x="-3.175" y="0.635" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="6.3" y="0" size="0.02" layer="27">&gt;VALUE</text>
</package>
<package name="J15MM">
<description>&lt;b&gt;JUMPER&lt;/b&gt;</description>
<wire x1="-6.4262" y1="0" x2="6.4262" y2="0" width="0.6096" layer="21"/>
<wire x1="7.62" y1="0" x2="6.477" y2="0" width="0.6096" layer="51"/>
<wire x1="-7.62" y1="0" x2="-6.477" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-7.62" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<pad name="2" x="7.62" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<text x="-5.715" y="0.635" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="7.5999" y="0" size="0.02" layer="27">&gt;VALUE</text>
</package>
<package name="J20MM">
<description>&lt;b&gt;JUMPER&lt;/b&gt;</description>
<wire x1="-8.9662" y1="0" x2="8.9662" y2="0" width="0.6096" layer="21"/>
<wire x1="10.16" y1="0" x2="9.017" y2="0" width="0.6096" layer="51"/>
<wire x1="-10.16" y1="0" x2="-9.017" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-10.16" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<pad name="2" x="10.16" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<text x="-8.255" y="0.635" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="10.1001" y="0" size="0.02" layer="27">&gt;VALUE</text>
</package>
<package name="J25MM">
<description>&lt;b&gt;JUMPER&lt;/b&gt;</description>
<wire x1="-11.5062" y1="0" x2="11.5062" y2="0" width="0.6096" layer="21"/>
<wire x1="12.7" y1="0" x2="11.557" y2="0" width="0.6096" layer="51"/>
<wire x1="-12.7" y1="0" x2="-11.557" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-12.7" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<pad name="2" x="12.7" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<text x="-10.795" y="0.635" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="12.5999" y="0" size="0.02" layer="27">&gt;VALUE</text>
</package>
<package name="J30MM">
<description>&lt;b&gt;JUMPER&lt;/b&gt;</description>
<wire x1="-14.0462" y1="0" x2="14.0462" y2="0" width="0.6096" layer="21"/>
<wire x1="15.24" y1="0" x2="14.097" y2="0" width="0.6096" layer="51"/>
<wire x1="-15.24" y1="0" x2="-14.097" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-15.24" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<pad name="2" x="15.24" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<text x="-13.335" y="0.635" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="15.2001" y="0" size="0.02" layer="27">&gt;VALUE</text>
</package>
<package name="J28MM">
<description>jumper / bridge</description>
<wire x1="-11.5062" y1="0" x2="14.0462" y2="0" width="0.6096" layer="21"/>
<wire x1="15.24" y1="0" x2="14.097" y2="0" width="0.6096" layer="51"/>
<wire x1="-12.7" y1="0" x2="-11.557" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-12.7" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<pad name="2" x="15.24" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<text x="-10.795" y="0.635" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="15.1399" y="0" size="0.02" layer="27">&gt;VALUE</text>
</package>
<package name="J50MM">
<description>50mm Jumper/bridge</description>
<wire x1="-24.0462" y1="0" x2="24.0462" y2="0" width="0.6096" layer="21"/>
<wire x1="25.24" y1="0" x2="24.097" y2="0" width="0.6096" layer="51"/>
<wire x1="-25.24" y1="0" x2="-24.097" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-25.4" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<pad name="2" x="25.4" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<text x="-13.335" y="0.635" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="15.2001" y="0" size="0.02" layer="27">&gt;VALUE</text>
</package>
<package name="J40MM">
<description>jumper/ bridge</description>
<wire x1="-19.1262" y1="0" x2="19.1262" y2="0" width="0.6096" layer="21"/>
<wire x1="20.32" y1="0" x2="19.177" y2="0" width="0.6096" layer="51"/>
<wire x1="-20.32" y1="0" x2="-19.177" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-20.32" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<pad name="2" x="20.32" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<text x="-18.415" y="0.635" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-0.0599" y="0" size="0.02" layer="27">&gt;VALUE</text>
</package>
<package name="J45MM">
<description>bridge / jumper</description>
<wire x1="-21.6662" y1="0" x2="21.6662" y2="0" width="0.6096" layer="21"/>
<wire x1="22.86" y1="0" x2="21.717" y2="0" width="0.6096" layer="51"/>
<wire x1="-22.86" y1="0" x2="-21.717" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-22.86" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<pad name="2" x="22.86" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<text x="-18.415" y="0.635" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-0.0599" y="0" size="0.02" layer="27">&gt;VALUE</text>
</package>
<package name="J35MM">
<wire x1="-17.8562" y1="0" x2="15.3962" y2="0" width="0.6096" layer="21"/>
<wire x1="15.32" y1="0" x2="14.177" y2="0" width="0.6096" layer="51"/>
<wire x1="-19.05" y1="0" x2="-17.907" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-19.05" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<pad name="2" x="15.32" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<text x="-17.145" y="0.635" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="1.2101" y="0" size="0.02" layer="27">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="J">
<wire x1="-2.54" y1="0" x2="-1.27" y2="1.27" width="0.1524" layer="94"/>
<wire x1="-1.27" y1="1.27" x2="1.27" y2="1.27" width="0.1524" layer="94"/>
<wire x1="2.54" y1="0" x2="1.27" y2="1.27" width="0.1524" layer="94"/>
<circle x="-2.54" y="0" radius="0.254" width="0.4064" layer="94"/>
<circle x="2.54" y="0" radius="0.254" width="0.4064" layer="94"/>
<text x="-2.54" y="1.905" size="1.778" layer="95">&gt;NAME</text>
<text x="-2.54" y="-2.54" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-5.08" y="0" visible="pad" length="short" direction="pas" swaplevel="1"/>
<pin name="2" x="5.08" y="0" visible="pad" length="short" direction="pas" swaplevel="1" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="J" prefix="J">
<description>Bridge/ jumper</description>
<gates>
<gate name="1" symbol="J" x="0" y="0"/>
</gates>
<devices>
<device name="5MM" package="J5MM">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="7MM" package="J7MM">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="10MM" package="J10MM">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="12MM" package="J12MM">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="15MM" package="J15MM">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="20MM" package="J20MM">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="25MM" package="J25MM">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="30MM" package="J30MM">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="28MM" package="J28MM">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="50MM" package="J50MM">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="40MM" package="J40MM">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="45MM" package="J45MM">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="35MM" package="J35MM">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="Gele_v05">
<packages>
<package name="SO-16DW">
<description>&lt;b&gt;DW (RPDSO-G16)&lt;/b&gt;&lt;p&gt;
Source: http://focus.ti.com/lit/ds/symlink/iso1176.pdf</description>
<wire x1="-5.395" y1="5.9" x2="5.395" y2="5.9" width="0.2" layer="39"/>
<wire x1="5.395" y1="-5.9" x2="-5.395" y2="-5.9" width="0.2" layer="39"/>
<wire x1="-5.395" y1="-5.9" x2="-5.395" y2="5.9" width="0.2" layer="39"/>
<wire x1="5.19" y1="-3.7" x2="-5.19" y2="-3.7" width="0.2032" layer="51"/>
<wire x1="-5.19" y1="-3.7" x2="-5.19" y2="3.7" width="0.2032" layer="51"/>
<wire x1="-5.19" y1="3.7" x2="5.19" y2="3.7" width="0.2032" layer="51"/>
<wire x1="5.19" y1="-3.2" x2="-5.19" y2="-3.2" width="0.2032" layer="21"/>
<wire x1="5.19" y1="3.7" x2="5.19" y2="-3.7" width="0.2032" layer="51"/>
<wire x1="5.395" y1="5.9" x2="5.395" y2="-5.9" width="0.2" layer="39"/>
<smd name="2" x="-3.175" y="-4.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="13" x="-0.635" y="4.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="1" x="-4.445" y="-4.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="3" x="-1.905" y="-4.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="4" x="-0.635" y="-4.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="14" x="-1.905" y="4.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="12" x="0.635" y="4.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="11" x="1.905" y="4.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="6" x="1.905" y="-4.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="9" x="4.445" y="4.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="5" x="0.635" y="-4.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="7" x="3.175" y="-4.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="10" x="3.175" y="4.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="8" x="4.445" y="-4.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="15" x="-3.175" y="4.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="16" x="-4.445" y="4.6" dx="0.6" dy="2.2" layer="1"/>
<text x="-4.445" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-4.445" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-4.69" y1="-5.32" x2="-4.2" y2="-3.8" layer="51"/>
<rectangle x1="-3.42" y1="-5.32" x2="-2.93" y2="-3.8" layer="51"/>
<rectangle x1="-2.15" y1="-5.32" x2="-1.66" y2="-3.8" layer="51"/>
<rectangle x1="-0.88" y1="-5.32" x2="-0.39" y2="-3.8" layer="51"/>
<rectangle x1="0.39" y1="-5.32" x2="0.88" y2="-3.8" layer="51"/>
<rectangle x1="1.66" y1="-5.32" x2="2.15" y2="-3.8" layer="51"/>
<rectangle x1="2.93" y1="-5.32" x2="3.42" y2="-3.8" layer="51"/>
<rectangle x1="4.2" y1="-5.32" x2="4.69" y2="-3.8" layer="51"/>
<rectangle x1="4.2" y1="3.8" x2="4.69" y2="5.32" layer="51"/>
<rectangle x1="2.93" y1="3.8" x2="3.42" y2="5.32" layer="51"/>
<rectangle x1="1.66" y1="3.8" x2="2.15" y2="5.32" layer="51"/>
<rectangle x1="0.39" y1="3.8" x2="0.88" y2="5.32" layer="51"/>
<rectangle x1="-0.88" y1="3.8" x2="-0.39" y2="5.32" layer="51"/>
<rectangle x1="-2.15" y1="3.8" x2="-1.66" y2="5.32" layer="51"/>
<rectangle x1="-3.42" y1="3.8" x2="-2.93" y2="5.32" layer="51"/>
<rectangle x1="-4.69" y1="3.8" x2="-4.2" y2="5.32" layer="51"/>
</package>
<package name="DIL14">
<description>&lt;b&gt;Dual In Line Package&lt;/b&gt;</description>
<wire x1="8.89" y1="2.921" x2="-8.89" y2="2.921" width="0.1524" layer="21"/>
<wire x1="-8.89" y1="-2.921" x2="8.89" y2="-2.921" width="0.1524" layer="21"/>
<wire x1="8.89" y1="2.921" x2="8.89" y2="-2.921" width="0.1524" layer="21"/>
<wire x1="-8.89" y1="2.921" x2="-8.89" y2="1.016" width="0.1524" layer="21"/>
<wire x1="-8.89" y1="-2.921" x2="-8.89" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="-8.89" y1="1.016" x2="-8.89" y2="-1.016" width="0.1524" layer="21" curve="-180"/>
<pad name="1" x="-7.62" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="2" x="-5.08" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="7" x="7.62" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="8" x="7.62" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="3" x="-2.54" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="4" x="0" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="6" x="5.08" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="5" x="2.54" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="9" x="5.08" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="10" x="2.54" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="11" x="0" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="12" x="-2.54" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="13" x="-5.08" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="14" x="-7.62" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<text x="-9.271" y="-3.048" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="-6.731" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="CON-20PIN-SMD-MANUALLY-BENT-FROM-NON-SMD">
<description>Connector, 2.54mm SMT Socket Header, 20 Pins, pins manually bent from non-SMT part</description>
<wire x1="25.4" y1="-1.25" x2="-25.4" y2="-1.25" width="0.127" layer="51"/>
<wire x1="-25.4" y1="-1.25" x2="-25.4" y2="1.25" width="0.127" layer="21"/>
<wire x1="-25.4" y1="1.25" x2="25.4" y2="1.25" width="0.127" layer="51"/>
<wire x1="25.4" y1="1.25" x2="25.4" y2="-1.25" width="0.127" layer="21"/>
<smd name="20" x="-24.13" y="-2.19" dx="1" dy="3" layer="1"/>
<smd name="18" x="-19.05" y="-2.19" dx="1" dy="3" layer="1"/>
<smd name="16" x="-13.97" y="-2.19" dx="1" dy="3" layer="1"/>
<smd name="14" x="-8.89" y="-2.19" dx="1" dy="3" layer="1"/>
<smd name="12" x="-3.81" y="-2.19" dx="1" dy="3" layer="1"/>
<smd name="10" x="1.27" y="-2.19" dx="1" dy="3" layer="1"/>
<smd name="8" x="6.35" y="-2.19" dx="1" dy="3" layer="1"/>
<smd name="6" x="11.43" y="-2.19" dx="1" dy="3" layer="1"/>
<smd name="4" x="16.51" y="-2.19" dx="1" dy="3" layer="1"/>
<smd name="2" x="21.59" y="-2.19" dx="1" dy="3" layer="1"/>
<smd name="1" x="24.13" y="2.19" dx="1" dy="3" layer="1"/>
<smd name="3" x="19.05" y="2.19" dx="1" dy="3" layer="1"/>
<smd name="5" x="13.97" y="2.19" dx="1" dy="3" layer="1"/>
<smd name="7" x="8.89" y="2.19" dx="1" dy="3" layer="1"/>
<smd name="9" x="3.81" y="2.19" dx="1" dy="3" layer="1"/>
<smd name="11" x="-1.27" y="2.19" dx="1" dy="3" layer="1"/>
<smd name="13" x="-6.35" y="2.19" dx="1" dy="3" layer="1"/>
<smd name="15" x="-11.43" y="2.19" dx="1" dy="3" layer="1"/>
<smd name="17" x="-16.51" y="2.19" dx="1" dy="3" layer="1"/>
<smd name="19" x="-21.59" y="2.19" dx="1" dy="3" layer="1"/>
<text x="-2.468" y="4.1125" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.248" y="-5.7806" size="1.27" layer="27">&gt;VALUE</text>
<wire x1="-22.35" y1="1.25" x2="-25.4" y2="1.25" width="0.127" layer="21"/>
<wire x1="-24.86" y1="-1.25" x2="-25.41" y2="-1.25" width="0.127" layer="21"/>
<wire x1="-25.41" y1="-1.25" x2="-25.41" y2="-1.24" width="0.127" layer="21"/>
<wire x1="-23.41" y1="-1.25" x2="-19.86" y2="-1.25" width="0.127" layer="21"/>
<wire x1="-18.29" y1="-1.25" x2="-14.74" y2="-1.25" width="0.127" layer="21"/>
<wire x1="-13.22" y1="-1.25" x2="-9.67" y2="-1.25" width="0.127" layer="21"/>
<wire x1="-8.08" y1="-1.25" x2="-4.53" y2="-1.25" width="0.127" layer="21"/>
<wire x1="-3.04" y1="-1.25" x2="0.51" y2="-1.25" width="0.127" layer="21"/>
<wire x1="2" y1="-1.25" x2="5.55" y2="-1.25" width="0.127" layer="21"/>
<wire x1="7.12" y1="-1.25" x2="10.67" y2="-1.25" width="0.127" layer="21"/>
<wire x1="12.18" y1="-1.25" x2="15.73" y2="-1.25" width="0.127" layer="21"/>
<wire x1="17.26" y1="-1.25" x2="20.81" y2="-1.25" width="0.127" layer="21"/>
<wire x1="22.31" y1="-1.25" x2="25.4" y2="-1.25" width="0.127" layer="21"/>
<wire x1="-20.85" y1="1.25" x2="-17.3" y2="1.25" width="0.127" layer="21"/>
<wire x1="-15.69" y1="1.25" x2="-12.14" y2="1.25" width="0.127" layer="21"/>
<wire x1="-10.64" y1="1.25" x2="-7.09" y2="1.25" width="0.127" layer="21"/>
<wire x1="-5.57" y1="1.25" x2="-2.02" y2="1.25" width="0.127" layer="21"/>
<wire x1="-0.48" y1="1.25" x2="3.07" y2="1.25" width="0.127" layer="21"/>
<wire x1="4.57" y1="1.25" x2="8.12" y2="1.25" width="0.127" layer="21"/>
<wire x1="9.67" y1="1.25" x2="13.22" y2="1.25" width="0.127" layer="21"/>
<wire x1="14.77" y1="1.25" x2="18.32" y2="1.25" width="0.127" layer="21"/>
<wire x1="19.83" y1="1.25" x2="23.38" y2="1.25" width="0.127" layer="21"/>
<wire x1="24.85" y1="1.25" x2="25.4" y2="1.25" width="0.127" layer="21"/>
<wire x1="-25.55" y1="3.9" x2="25.65" y2="3.9" width="0.127" layer="39"/>
<wire x1="25.65" y1="3.9" x2="25.65" y2="-3.9" width="0.127" layer="39"/>
<wire x1="25.65" y1="-3.9" x2="-25.55" y2="-3.9" width="0.127" layer="39"/>
<wire x1="-25.55" y1="-3.9" x2="-25.55" y2="3.9" width="0.127" layer="39"/>
</package>
</packages>
<symbols>
<symbol name="IR2110">
<wire x1="7.62" y1="17.78" x2="-7.62" y2="17.78" width="0.254" layer="94"/>
<wire x1="-7.62" y1="17.78" x2="-7.62" y2="-17.78" width="0.254" layer="94"/>
<wire x1="-7.62" y1="-17.78" x2="7.62" y2="-17.78" width="0.254" layer="94"/>
<wire x1="7.62" y1="-17.78" x2="7.62" y2="17.78" width="0.254" layer="94"/>
<text x="-7.62" y="17.78" size="1.778" layer="94">&gt;NAME</text>
<text x="-7.62" y="-20.32" size="1.778" layer="94">&gt;VALUE</text>
<pin name="!SD" x="-12.7" y="0" length="middle" direction="in"/>
<pin name="HIN" x="-12.7" y="5.08" length="middle" direction="in"/>
<pin name="LIN" x="-12.7" y="-5.08" length="middle" direction="in"/>
<pin name="VDD" x="-12.7" y="10.16" length="middle" direction="sup"/>
<pin name="VSS" x="-12.7" y="-10.16" length="middle" direction="sup"/>
<pin name="VCC" x="12.7" y="-5.08" length="middle" direction="sup" rot="R180"/>
<pin name="COM" x="12.7" y="-15.24" length="middle" direction="sup" rot="R180"/>
<pin name="VS" x="12.7" y="5.08" length="middle" direction="sup" rot="R180"/>
<pin name="VB" x="12.7" y="15.24" length="middle" direction="sup" rot="R180"/>
<pin name="HO" x="12.7" y="10.16" length="middle" direction="out" rot="R180"/>
<pin name="LO" x="12.7" y="-10.16" length="middle" direction="out" rot="R180"/>
</symbol>
<symbol name="20">
<wire x1="-4.191" y1="23.749" x2="-4.191" y2="21.971" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="-4.191" y1="21.209" x2="-4.191" y2="19.431" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="-4.191" y1="18.669" x2="-4.191" y2="16.891" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="-4.191" y1="16.129" x2="-4.191" y2="14.351" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="-4.191" y1="13.589" x2="-4.191" y2="11.811" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="-4.191" y1="11.049" x2="-4.191" y2="9.271" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="-4.191" y1="8.509" x2="-4.191" y2="6.731" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="-4.191" y1="5.969" x2="-4.191" y2="4.191" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="-4.191" y1="3.429" x2="-4.191" y2="1.651" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="-4.191" y1="0.889" x2="-4.191" y2="-0.889" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="-4.191" y1="-1.651" x2="-4.191" y2="-3.429" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="-4.191" y1="-4.191" x2="-4.191" y2="-5.969" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="-4.191" y1="-6.731" x2="-4.191" y2="-8.509" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="-4.191" y1="-9.271" x2="-4.191" y2="-11.049" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="-4.191" y1="-11.811" x2="-4.191" y2="-13.589" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="-4.191" y1="-14.351" x2="-4.191" y2="-16.129" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="-4.191" y1="-16.891" x2="-4.191" y2="-18.669" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="-4.191" y1="-19.431" x2="-4.191" y2="-21.209" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="-4.191" y1="-21.971" x2="-4.191" y2="-23.749" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="-4.191" y1="-24.511" x2="-4.191" y2="-26.289" width="0.254" layer="94" curve="180" cap="flat"/>
<text x="1.27" y="-2.302" size="1.778" layer="95">&gt;NAME</text>
<text x="1.27" y="-5.08" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-7.62" y="22.86" visible="pad" length="short" direction="pas"/>
<pin name="2" x="-7.62" y="20.32" visible="pad" length="short" direction="pas"/>
<pin name="3" x="-7.62" y="17.78" visible="pad" length="short" direction="pas"/>
<pin name="4" x="-7.62" y="15.24" visible="pad" length="short" direction="pas"/>
<pin name="5" x="-7.62" y="12.7" visible="pad" length="short" direction="pas"/>
<pin name="6" x="-7.62" y="10.16" visible="pad" length="short" direction="pas"/>
<pin name="7" x="-7.62" y="7.62" visible="pad" length="short" direction="pas"/>
<pin name="8" x="-7.62" y="5.08" visible="pad" length="short" direction="pas"/>
<pin name="9" x="-7.62" y="2.54" visible="pad" length="short" direction="pas"/>
<pin name="10" x="-7.62" y="0" visible="pad" length="short" direction="pas"/>
<pin name="11" x="-7.62" y="-2.54" visible="pad" length="short" direction="pas"/>
<pin name="12" x="-7.62" y="-5.08" visible="pad" length="short" direction="pas"/>
<pin name="13" x="-7.62" y="-7.62" visible="pad" length="short" direction="pas"/>
<pin name="14" x="-7.62" y="-10.16" visible="pad" length="short" direction="pas"/>
<pin name="15" x="-7.62" y="-12.7" visible="pad" length="short" direction="pas"/>
<pin name="16" x="-7.62" y="-15.24" visible="pad" length="short" direction="pas"/>
<pin name="17" x="-7.62" y="-17.78" visible="pad" length="short" direction="pas"/>
<pin name="18" x="-7.62" y="-20.32" visible="pad" length="short" direction="pas"/>
<pin name="19" x="-7.62" y="-22.86" visible="pad" length="short" direction="pas"/>
<pin name="20" x="-7.62" y="-25.4" visible="pad" length="short" direction="pas"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="IR2110" prefix="IC">
<gates>
<gate name="G$1" symbol="IR2110" x="0" y="0"/>
</gates>
<devices>
<device name="D" package="DIL14">
<connects>
<connect gate="G$1" pin="!SD" pad="11"/>
<connect gate="G$1" pin="COM" pad="2"/>
<connect gate="G$1" pin="HIN" pad="10"/>
<connect gate="G$1" pin="HO" pad="7"/>
<connect gate="G$1" pin="LIN" pad="12"/>
<connect gate="G$1" pin="LO" pad="1"/>
<connect gate="G$1" pin="VB" pad="6"/>
<connect gate="G$1" pin="VCC" pad="3"/>
<connect gate="G$1" pin="VDD" pad="9"/>
<connect gate="G$1" pin="VS" pad="5"/>
<connect gate="G$1" pin="VSS" pad="13"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="S" package="SO-16DW">
<connects>
<connect gate="G$1" pin="!SD" pad="13"/>
<connect gate="G$1" pin="COM" pad="2"/>
<connect gate="G$1" pin="HIN" pad="12"/>
<connect gate="G$1" pin="HO" pad="8"/>
<connect gate="G$1" pin="LIN" pad="14"/>
<connect gate="G$1" pin="LO" pad="1"/>
<connect gate="G$1" pin="VB" pad="7"/>
<connect gate="G$1" pin="VCC" pad="3"/>
<connect gate="G$1" pin="VDD" pad="11"/>
<connect gate="G$1" pin="VS" pad="6"/>
<connect gate="G$1" pin="VSS" pad="15"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="61002013321" prefix="J" uservalue="yes">
<description>&lt;b&gt;2.54mm SMT Socket Header, 20 Pins, hand-bent from non-smd part&lt;/b&gt;=&gt;</description>
<gates>
<gate name="G$1" symbol="20" x="7.62" y="-2.54"/>
</gates>
<devices>
<device name="" package="CON-20PIN-SMD-MANUALLY-BENT-FROM-NON-SMD">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="10" pad="10"/>
<connect gate="G$1" pin="11" pad="11"/>
<connect gate="G$1" pin="12" pad="12"/>
<connect gate="G$1" pin="13" pad="13"/>
<connect gate="G$1" pin="14" pad="14"/>
<connect gate="G$1" pin="15" pad="15"/>
<connect gate="G$1" pin="16" pad="16"/>
<connect gate="G$1" pin="17" pad="17"/>
<connect gate="G$1" pin="18" pad="18"/>
<connect gate="G$1" pin="19" pad="19"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="20" pad="20"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
<connect gate="G$1" pin="7" pad="7"/>
<connect gate="G$1" pin="8" pad="8"/>
<connect gate="G$1" pin="9" pad="9"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="pinhead-2">
<description>&lt;b&gt;Pin Header Connectors&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de, Modified by Cougar@CasaDelGato.Com&lt;/author&gt;</description>
<packages>
<package name="1X04SMD">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt; - 2.54 SMD</description>
<wire x1="-1.905" y1="1.27" x2="-0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="-0.635" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-0.635" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.27" x2="1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="1.27" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-0.635" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.27" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="3.175" y1="1.27" x2="4.445" y2="1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="1.27" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-0.635" x2="4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="1.27" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="0.635" x2="5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-1.27" x2="2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-1.27" x2="4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-0.635" x2="6.985" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="5.715" y1="-1.27" x2="5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="5.715" y1="-1.27" x2="6.985" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="7.62" y1="0.635" x2="7.62" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="6.985" y1="1.27" x2="7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.715" y1="1.27" x2="6.985" y2="1.27" width="0.1524" layer="21"/>
<wire x1="5.715" y1="1.27" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<smd name="1" x="-1.27" y="1.27" dx="3.302" dy="1.016" layer="1" rot="R270"/>
<smd name="2" x="1.27" y="-1.27" dx="3.302" dy="1.016" layer="1" rot="R90"/>
<smd name="3" x="3.81" y="1.27" dx="3.302" dy="1.016" layer="1" rot="R270"/>
<smd name="4" x="6.35" y="-1.27" dx="3.302" dy="1.016" layer="1" rot="R90"/>
<text x="-2.6162" y="1.8288" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.54" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.524" y1="-0.254" x2="-1.016" y2="0.254" layer="51"/>
<rectangle x1="1.016" y1="-0.254" x2="1.524" y2="0.254" layer="51"/>
<rectangle x1="3.556" y1="-0.254" x2="4.064" y2="0.254" layer="51"/>
<rectangle x1="6.096" y1="-0.254" x2="6.604" y2="0.254" layer="51"/>
</package>
<package name="1X04">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt; - 2.54</description>
<wire x1="0" y1="0.635" x2="0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.27" x2="1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="1.27" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-0.635" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.27" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="1.27" x2="-3.175" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="1.27" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-0.635" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="-0.635" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-1.27" x2="-2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.635" x2="-5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="1.27" x2="-5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-0.635" x2="-4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-1.27" x2="-4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="1.27" x2="4.445" y2="1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="1.27" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="0.635" x2="5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-0.635" x2="4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="1.27" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-0.635" x2="3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="-1.27" x2="3.175" y2="-1.27" width="0.1524" layer="21"/>
<pad name="1" x="-3.81" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="-1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="4" x="3.81" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="-5.1562" y="1.8288" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="1.016" y1="-0.254" x2="1.524" y2="0.254" layer="51"/>
<rectangle x1="-1.524" y1="-0.254" x2="-1.016" y2="0.254" layer="51"/>
<rectangle x1="-4.064" y1="-0.254" x2="-3.556" y2="0.254" layer="51"/>
<rectangle x1="3.556" y1="-0.254" x2="4.064" y2="0.254" layer="51"/>
</package>
<package name="1X04-S">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt; - 2.54</description>
<wire x1="0" y1="0.635" x2="0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.27" x2="1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="1.27" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-0.635" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.27" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="1.27" x2="-3.175" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="1.27" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-0.635" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="-0.635" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-1.27" x2="-2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.635" x2="-5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="1.27" x2="-5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-0.635" x2="-4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-1.27" x2="-4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="1.27" x2="4.445" y2="1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="1.27" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="0.635" x2="5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-0.635" x2="4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="1.27" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-0.635" x2="3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="-1.27" x2="3.175" y2="-1.27" width="0.1524" layer="21"/>
<pad name="1" x="-3.81" y="0" drill="1.016" shape="square"/>
<pad name="2" x="-1.27" y="0" drill="1.016" shape="octagon"/>
<pad name="3" x="1.27" y="0" drill="1.016" shape="octagon"/>
<pad name="4" x="3.81" y="0" drill="1.016" shape="octagon"/>
<text x="-5.1562" y="1.8288" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="1.016" y1="-0.254" x2="1.524" y2="0.254" layer="51"/>
<rectangle x1="-1.524" y1="-0.254" x2="-1.016" y2="0.254" layer="51"/>
<rectangle x1="-4.064" y1="-0.254" x2="-3.556" y2="0.254" layer="51"/>
<rectangle x1="3.556" y1="-0.254" x2="4.064" y2="0.254" layer="51"/>
</package>
<package name="1X04/90">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt; - 2.54 90°</description>
<wire x1="-5.08" y1="-1.905" x2="-2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-1.905" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.635" x2="-5.08" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="6.985" x2="-3.81" y2="1.27" width="0.762" layer="21"/>
<wire x1="-2.54" y1="-1.905" x2="0" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="0" y1="-1.905" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="6.985" x2="-1.27" y2="1.27" width="0.762" layer="21"/>
<wire x1="0" y1="-1.905" x2="2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="6.985" x2="1.27" y2="1.27" width="0.762" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="5.08" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-1.905" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="0.635" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="6.985" x2="3.81" y2="1.27" width="0.762" layer="21"/>
<pad name="1" x="-3.81" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="-1.27" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="1.27" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="4" x="3.81" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<text x="-5.715" y="-3.81" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="6.985" y="-4.445" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-4.191" y1="0.635" x2="-3.429" y2="1.143" layer="21"/>
<rectangle x1="-1.651" y1="0.635" x2="-0.889" y2="1.143" layer="21"/>
<rectangle x1="0.889" y1="0.635" x2="1.651" y2="1.143" layer="21"/>
<rectangle x1="3.429" y1="0.635" x2="4.191" y2="1.143" layer="21"/>
<rectangle x1="-4.191" y1="-2.921" x2="-3.429" y2="-1.905" layer="21"/>
<rectangle x1="-1.651" y1="-2.921" x2="-0.889" y2="-1.905" layer="21"/>
<rectangle x1="0.889" y1="-2.921" x2="1.651" y2="-1.905" layer="21"/>
<rectangle x1="3.429" y1="-2.921" x2="4.191" y2="-1.905" layer="21"/>
</package>
<package name="1X04/90-S">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt; - 2.54 90°</description>
<wire x1="-5.08" y1="-1.905" x2="-2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-1.905" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.635" x2="-5.08" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="6.985" x2="-3.81" y2="1.27" width="0.762" layer="21"/>
<wire x1="-2.54" y1="-1.905" x2="0" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="0" y1="-1.905" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="6.985" x2="-1.27" y2="1.27" width="0.762" layer="21"/>
<wire x1="0" y1="-1.905" x2="2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="6.985" x2="1.27" y2="1.27" width="0.762" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="5.08" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-1.905" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="0.635" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="6.985" x2="3.81" y2="1.27" width="0.762" layer="21"/>
<pad name="1" x="-3.81" y="-3.81" drill="1.016" shape="square"/>
<pad name="2" x="-1.27" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="3" x="1.27" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="4" x="3.81" y="-3.81" drill="1.016" shape="octagon"/>
<text x="-5.715" y="-3.81" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="6.985" y="-4.445" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-4.191" y1="0.635" x2="-3.429" y2="1.143" layer="21"/>
<rectangle x1="-1.651" y1="0.635" x2="-0.889" y2="1.143" layer="21"/>
<rectangle x1="0.889" y1="0.635" x2="1.651" y2="1.143" layer="21"/>
<rectangle x1="3.429" y1="0.635" x2="4.191" y2="1.143" layer="21"/>
<rectangle x1="-4.191" y1="-2.921" x2="-3.429" y2="-1.905" layer="21"/>
<rectangle x1="-1.651" y1="-2.921" x2="-0.889" y2="-1.905" layer="21"/>
<rectangle x1="0.889" y1="-2.921" x2="1.651" y2="-1.905" layer="21"/>
<rectangle x1="3.429" y1="-2.921" x2="4.191" y2="-1.905" layer="21"/>
</package>
<package name="1X04M">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt; - 2</description>
<wire x1="4.25" y1="1.25" x2="4.25" y2="-1.25" width="0.2032" layer="21"/>
<wire x1="4.25" y1="-1.25" x2="-4.25" y2="-1.25" width="0.2032" layer="21"/>
<wire x1="-4.25" y1="-1.25" x2="-4.25" y2="1.25" width="0.2032" layer="21"/>
<wire x1="-4.25" y1="1.25" x2="4.25" y2="1.25" width="0.2032" layer="21"/>
<pad name="1" x="-3" y="0" drill="0.9144" shape="square"/>
<pad name="2" x="-1" y="0" drill="0.9144"/>
<pad name="3" x="1" y="0" drill="0.9144" rot="R270"/>
<pad name="4" x="3" y="0" drill="0.9144" rot="R270"/>
<text x="-5" y="-1" size="1.016" layer="25" ratio="14" rot="R90">&gt;NAME</text>
<text x="6" y="-1" size="0.8128" layer="27" ratio="10" rot="R90">&gt;VALUE</text>
<rectangle x1="-1.25" y1="-0.25" x2="-0.75" y2="0.25" layer="51"/>
<rectangle x1="-3.25" y1="-0.25" x2="-2.75" y2="0.25" layer="51"/>
<rectangle x1="2.75" y1="-0.25" x2="3.25" y2="0.25" layer="51" rot="R270"/>
<rectangle x1="0.75" y1="-0.25" x2="1.25" y2="0.25" layer="51" rot="R270"/>
</package>
<package name="1X04SMD/90">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt; - 2.54 90°</description>
<wire x1="-2.54" y1="-1.905" x2="0" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="0" y1="-1.905" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="6.0325" x2="-1.27" y2="1.27" width="0.762" layer="21"/>
<wire x1="-1.27" y1="-2.54" x2="-1.27" y2="-5.08" width="0.4064" layer="21"/>
<wire x1="1.27" y1="6.0325" x2="1.27" y2="1.27" width="0.762" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="-1.905" x2="2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-2.54" x2="1.27" y2="-5.08" width="0.4064" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="5.08" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-1.905" x2="7.62" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-1.905" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-1.905" x2="7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="0.635" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="7.62" y1="0.635" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="6.0325" x2="3.81" y2="1.27" width="0.762" layer="21"/>
<wire x1="6.35" y1="6.0325" x2="6.35" y2="1.27" width="0.762" layer="21"/>
<wire x1="3.81" y1="-2.54" x2="3.81" y2="-5.08" width="0.4064" layer="21"/>
<wire x1="6.35" y1="-2.54" x2="6.35" y2="-5.08" width="0.4064" layer="21"/>
<smd name="1" x="-1.27" y="-5.08" dx="1.778" dy="1.016" layer="1" rot="R90"/>
<smd name="2" x="1.27" y="-5.08" dx="1.778" dy="1.016" layer="1" rot="R90"/>
<smd name="3" x="3.81" y="-5.08" dx="1.778" dy="1.016" layer="1" rot="R90"/>
<smd name="4" x="6.35" y="-5.08" dx="1.778" dy="1.016" layer="1" rot="R90"/>
<text x="-3.175" y="-3.81" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="9.525" y="-3.81" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-1.651" y1="0.635" x2="-0.889" y2="1.143" layer="21"/>
<rectangle x1="-1.651" y1="-2.921" x2="-0.889" y2="-1.905" layer="21"/>
<rectangle x1="0.889" y1="0.635" x2="1.651" y2="1.143" layer="21"/>
<rectangle x1="0.889" y1="-2.921" x2="1.651" y2="-1.905" layer="21"/>
<rectangle x1="3.429" y1="0.635" x2="4.191" y2="1.143" layer="21"/>
<rectangle x1="5.969" y1="0.635" x2="6.731" y2="1.143" layer="21"/>
<rectangle x1="3.429" y1="-2.921" x2="4.191" y2="-1.905" layer="21"/>
<rectangle x1="5.969" y1="-2.921" x2="6.731" y2="-1.905" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="PINH1X04">
<wire x1="-6.35" y1="-5.08" x2="1.27" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="1.27" y1="-5.08" x2="1.27" y2="7.62" width="0.4064" layer="94"/>
<wire x1="1.27" y1="7.62" x2="-6.35" y2="7.62" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="7.62" x2="-6.35" y2="-5.08" width="0.4064" layer="94"/>
<text x="-6.35" y="8.255" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-7.62" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="5.08" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="2" x="-2.54" y="2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="3" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="4" x="-2.54" y="-2.54" visible="pad" length="short" direction="pas" function="dot"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="PINHD-1X04" prefix="JP" uservalue="yes">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="A" symbol="PINH1X04" x="0" y="0"/>
</gates>
<devices>
<device name="_2.54" package="1X04">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_2.54-S" package="1X04-S">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_2.54-90°" package="1X04/90">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_2.54-90°-S" package="1X04/90-S">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_2.00" package="1X04M">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_2.54-SMD" package="1X04SMD">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_2.54-SMD-90°" package="1X04SMD/90">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="V_MOTOR" library="SteveMarple" deviceset="PAD" device="" value="V_MOTOR"/>
<part name="IC1" library="Gele_v05" deviceset="IR2110" device="S"/>
<part name="U$1" library="Misc_HEXFET_Transistors" deviceset="IRF8313" device=""/>
<part name="R1" library="microbuilder" deviceset="RESISTOR" device="_0805MP" value="8.2Ω"/>
<part name="R2" library="microbuilder" deviceset="RESISTOR" device="_0805MP" value="8.2Ω"/>
<part name="C3" library="microbuilder" deviceset="CAP_CERAMIC" device="_0805MP" value="100n"/>
<part name="U$5" library="microbuilder" deviceset="GND" device=""/>
<part name="U$6" library="microbuilder" deviceset="GND" device=""/>
<part name="U$7" library="microbuilder" deviceset="GND" device=""/>
<part name="C4" library="microbuilder" deviceset="CAP_CERAMIC" device="_0603MP" value="100n"/>
<part name="U$9" library="microbuilder" deviceset="GND" device=""/>
<part name="C5" library="microbuilder" deviceset="CAP_CERAMIC" device="_0805MP" value="4.7uF/25v"/>
<part name="R3" library="microbuilder" deviceset="RESISTOR" device="_0805MP" value="15kΩ-1%"/>
<part name="R4" library="microbuilder" deviceset="RESISTOR" device="_0805MP" value="0"/>
<part name="R5" library="microbuilder" deviceset="RESISTOR" device="_0805MP" value="10kΩ"/>
<part name="R6" library="microbuilder" deviceset="RESISTOR" device="_0805MP" value="10kΩ"/>
<part name="R7" library="microbuilder" deviceset="RESISTOR" device="_0805MP" value="2.2kΩ-1%"/>
<part name="U$14" library="microbuilder" deviceset="GND" device=""/>
<part name="C8" library="microbuilder" deviceset="CAP_CERAMIC" device="_0805MP" value="10nF"/>
<part name="U$15" library="microbuilder" deviceset="GND" device=""/>
<part name="IC5" library="Gele_v05" deviceset="IR2110" device="S"/>
<part name="U$16" library="Misc_HEXFET_Transistors" deviceset="IRF8313" device=""/>
<part name="R9" library="microbuilder" deviceset="RESISTOR" device="_0805MP" value="8.2"/>
<part name="R10" library="microbuilder" deviceset="RESISTOR" device="_0805MP" value="8.2Ω"/>
<part name="C9" library="microbuilder" deviceset="CAP_CERAMIC" device="_0603MP" value="100n"/>
<part name="U$17" library="microbuilder" deviceset="GND" device=""/>
<part name="U$18" library="microbuilder" deviceset="GND" device=""/>
<part name="U$19" library="microbuilder" deviceset="GND" device=""/>
<part name="C10" library="microbuilder" deviceset="CAP_CERAMIC" device="_0603MP" value="100n"/>
<part name="U$20" library="microbuilder" deviceset="GND" device=""/>
<part name="C11" library="microbuilder" deviceset="CAP_CERAMIC" device="_0805MP" value="4.7uF/25v"/>
<part name="R11" library="microbuilder" deviceset="RESISTOR" device="_0805MP" value="15kΩ-1%"/>
<part name="R12" library="microbuilder" deviceset="RESISTOR" device="_0805MP" value="0Ω"/>
<part name="R13" library="microbuilder" deviceset="RESISTOR" device="_0805MP" value="10kΩ"/>
<part name="R14" library="microbuilder" deviceset="RESISTOR" device="_0805MP" value="10kΩ"/>
<part name="R15" library="microbuilder" deviceset="RESISTOR" device="_0805MP" value="2.2kΩ-1%"/>
<part name="U$22" library="microbuilder" deviceset="GND" device=""/>
<part name="C12" library="microbuilder" deviceset="CAP_CERAMIC" device="_0805MP" value="10nF"/>
<part name="U$23" library="microbuilder" deviceset="GND" device=""/>
<part name="IC2" library="Gele_v05" deviceset="IR2110" device="S"/>
<part name="U$10" library="Misc_HEXFET_Transistors" deviceset="IRF8313" device=""/>
<part name="R21" library="microbuilder" deviceset="RESISTOR" device="_0805MP" value="8.2Ω"/>
<part name="R22" library="microbuilder" deviceset="RESISTOR" device="_0805MP" value="8.2Ω"/>
<part name="U$24" library="microbuilder" deviceset="GND" device=""/>
<part name="U$25" library="microbuilder" deviceset="GND" device=""/>
<part name="C14" library="microbuilder" deviceset="CAP_CERAMIC" device="_0603MP" value="100n"/>
<part name="U$26" library="microbuilder" deviceset="GND" device=""/>
<part name="C15" library="microbuilder" deviceset="CAP_CERAMIC" device="_0805MP" value="4.7uF/25v"/>
<part name="R23" library="microbuilder" deviceset="RESISTOR" device="_0805MP" value="15kΩ-1%"/>
<part name="R24" library="microbuilder" deviceset="RESISTOR" device="_0805MP" value="0"/>
<part name="R25" library="microbuilder" deviceset="RESISTOR" device="_0805MP" value="10kΩ"/>
<part name="R26" library="microbuilder" deviceset="RESISTOR" device="_0805MP" value="10kΩ"/>
<part name="R27" library="microbuilder" deviceset="RESISTOR" device="_0805MP" value="2.2kΩ-1%"/>
<part name="U$28" library="microbuilder" deviceset="GND" device=""/>
<part name="C16" library="microbuilder" deviceset="CAP_CERAMIC" device="_0805MP" value="10nF"/>
<part name="U$29" library="microbuilder" deviceset="GND" device=""/>
<part name="U$31" library="microbuilder" deviceset="GND" device=""/>
<part name="R31" library="microbuilder" deviceset="RESISTOR" device="2512" value="20mΩ|0.02Ω-1%"/>
<part name="R32" library="microbuilder" deviceset="RESISTOR" device="_0805MP" value="91Ω-1%"/>
<part name="R33" library="microbuilder" deviceset="RESISTOR" device="_0805MP" value="11kΩ-1%"/>
<part name="U$33" library="microbuilder" deviceset="GND" device=""/>
<part name="R34" library="microbuilder" deviceset="RESISTOR" device="_0805MP" value="600Ω"/>
<part name="C18" library="microbuilder" deviceset="CAP_CERAMIC" device="_0805MP" value="100n"/>
<part name="U$34" library="microbuilder" deviceset="GND" device=""/>
<part name="C19" library="microbuilder" deviceset="CAP_CERAMIC" device="_0805MP" value="1u"/>
<part name="U$35" library="microbuilder" deviceset="GND" device=""/>
<part name="BLUEPILL-STM32F103C8T6_MODULE" library="maplemini" deviceset="BLUEPILL" device="">
<attribute name="NAME1" value="STM32F103C8T6 bluepill module"/>
</part>
<part name="U$37" library="microbuilder" deviceset="GND" device=""/>
<part name="U$38" library="microbuilder" deviceset="GND" device=""/>
<part name="R35" library="microbuilder" deviceset="RESISTOR" device="_0805MP" value="10kΩ-1%"/>
<part name="R36" library="microbuilder" deviceset="RESISTOR" device="_0805MP" value="1.5kΩ-1%"/>
<part name="U$39" library="microbuilder" deviceset="GND" device=""/>
<part name="C20" library="microbuilder" deviceset="CAP_CERAMIC" device="_0805MP" value="4.7u"/>
<part name="D4" library="adafruit[some parts from microbuilder.eu]" deviceset="DIODE" device="SMA" value="1N4007/SMA"/>
<part name="R37" library="microbuilder" deviceset="RESISTOR" device="_0805MP" value="91Ω-1%"/>
<part name="IC3" library="linear" deviceset="78L*" device="F" technology="05"/>
<part name="U$41" library="microbuilder" deviceset="GND" device=""/>
<part name="PHASE_A" library="SteveMarple" deviceset="PAD" device="" value="PHASE_A"/>
<part name="PHASE_B" library="SteveMarple" deviceset="PAD" device="" value="PHASE_B"/>
<part name="PHASE_C" library="SteveMarple" deviceset="PAD" device="" value="PHASE_C"/>
<part name="D1" library="adafruit[some parts from microbuilder.eu]" deviceset="DIODE" device="SOD-123" value="B0540W@SOD123"/>
<part name="J2" library="jumper" deviceset="J" device="10MM" value="J10MM"/>
<part name="C6" library="microbuilder" deviceset="CAP_CERAMIC" device="_0805MP" value="10uF/25v"/>
<part name="J3" library="jumper" deviceset="J" device="10MM" value="J10MM"/>
<part name="J4" library="jumper" deviceset="J" device="20MM" value="J20MM"/>
<part name="J5" library="jumper" deviceset="J" device="15MM" value="J15MM"/>
<part name="D2" library="adafruit[some parts from microbuilder.eu]" deviceset="DIODE" device="SOD-123" value="B0540W@SOD123"/>
<part name="C7" library="microbuilder" deviceset="CAP_CERAMIC" device="_0805MP" value="10uF/25v"/>
<part name="D3" library="adafruit[some parts from microbuilder.eu]" deviceset="DIODE" device="SOD-123" value="B0540W@SOD123"/>
<part name="C1" library="microbuilder" deviceset="CAP_CERAMIC" device="_0805MP" value="10uF/25v"/>
<part name="C2" library="microbuilder" deviceset="CAP_CERAMIC" device="_0805MP" value="10uF/25v"/>
<part name="U$2" library="microbuilder" deviceset="GND" device=""/>
<part name="U$3" library="microbuilder" deviceset="GND" device=""/>
<part name="C13" library="microbuilder" deviceset="CAP_CERAMIC" device="_0805MP" value="10uF/25v"/>
<part name="U$4" library="microbuilder" deviceset="GND" device=""/>
<part name="J9" library="jumper" deviceset="J" device="12MM" value="J12MM"/>
<part name="JP1" library="pinhead-2" deviceset="PINHD-1X04" device="_2.54-SMD"/>
<part name="U$8" library="microbuilder" deviceset="GND" device=""/>
<part name="J11" library="jumper" deviceset="J" device="20MM" value="J20MM"/>
<part name="J14" library="Gele_v05" deviceset="61002013321" device=""/>
<part name="J15" library="Gele_v05" deviceset="61002013321" device=""/>
<part name="R8" library="microbuilder" deviceset="RESISTOR" device="_0805MP" value="0"/>
<part name="R16" library="microbuilder" deviceset="RESISTOR" device="_0805MP" value="0Ω"/>
<part name="IC4" library="linear" deviceset="MCP601" device="OT"/>
<part name="J1" library="Gele_v04" deviceset="J" device="35MM" value="J35MM"/>
<part name="R20" library="microbuilder" deviceset="RESISTOR" device="_0805MP" value="0Ω"/>
<part name="R28" library="microbuilder" deviceset="RESISTOR" device="_0805MP" value="0Ω"/>
<part name="R29" library="microbuilder" deviceset="RESISTOR" device="_0805MP" value="11kΩ-1%"/>
</parts>
<sheets>
<sheet>
<plain>
<wire x1="-16.51" y1="0" x2="-16.51" y2="934.72" width="0.1524" layer="98"/>
<wire x1="-16.51" y1="0" x2="1998.98" y2="0" width="0.1524" layer="98"/>
<wire x1="-16.51" y1="0" x2="-523.875" y2="0" width="0.1524" layer="98"/>
<frame x1="113.665" y1="85.725" x2="1306.195" y2="923.925" columns="8" rows="5" layer="91" border-top="no" border-right="no" border-bottom="no"/>
<text x="608.0633" y="908.0627" size="6.4516" layer="97">Drawn at Grid = 0.635 mm = 0.025inch</text>
<text x="717.9183" y="580.4027" size="1.4224" layer="97">It was for per phase current sens.
R=0.0203 Ω 
PCB FR4 1 oz = 0.035 mm
W=0.406 mm L=17 mm</text>
<text x="653.7833" y="499.1227" size="1.4224" layer="97">Kamp need=~127 times for 0.02Ω shunt, 
Kamp=~51times for 0.05Ω|50mΩ shunt
PCB Shunt 0.0203 Ω at PCB FR4 ,1 oz = 0.035 mm
W=0.406 mm L=17 mm
Kamp=(R29/R32) - see classical difference amplifier sch</text>
<text x="653.7833" y="489.5977" size="1.4224" layer="97">The opamp should be w. lowest possible offset. 
Some of them:  TLC277 </text>
</plain>
<instances>
<instance part="V_MOTOR" gate="G$1" x="716.915" y="862.33"/>
<instance part="IC1" gate="G$1" x="637.54" y="612.14"/>
<instance part="U$1" gate="G$1" x="714.375" y="622.3"/>
<instance part="U$1" gate="G$2" x="714.375" y="601.98"/>
<instance part="R1" gate="G$1" x="696.595" y="622.3"/>
<instance part="R2" gate="G$1" x="696.595" y="601.98"/>
<instance part="C3" gate="G$1" x="620.395" y="628.65" smashed="yes" rot="R90">
<attribute name="NAME" x="617.855" y="632.46" size="1.27" layer="95" font="vector" rot="R180"/>
<attribute name="VALUE" x="622.935" y="632.46" size="1.27" layer="96" font="vector" rot="R180"/>
</instance>
<instance part="U$5" gate="G$1" x="611.505" y="628.65" rot="R270"/>
<instance part="U$6" gate="G$1" x="650.875" y="593.09"/>
<instance part="U$7" gate="G$1" x="624.205" y="593.09"/>
<instance part="C4" gate="G$1" x="661.035" y="601.345" smashed="yes" rot="R180">
<attribute name="NAME" x="662.94" y="599.44" size="1.27" layer="95" font="vector"/>
<attribute name="VALUE" x="662.305" y="597.535" size="1.27" layer="96" font="vector"/>
</instance>
<instance part="U$9" gate="G$1" x="661.035" y="593.09"/>
<instance part="C5" gate="G$1" x="660.4" y="617.22" smashed="yes" rot="R270">
<attribute name="NAME" x="657.86" y="614.68" size="1.27" layer="95" font="vector"/>
<attribute name="VALUE" x="662.94" y="614.68" size="1.27" layer="96" font="vector"/>
</instance>
<instance part="R3" gate="G$1" x="678.815" y="594.36" smashed="yes" rot="R270">
<attribute name="NAME" x="680.847" y="596.9" size="1.27" layer="95" font="vector" rot="R270"/>
<attribute name="VALUE" x="675.64" y="598.805" size="1.27" layer="96" font="vector" rot="R270"/>
</instance>
<instance part="R4" gate="G$1" x="603.885" y="601.98" rot="R180"/>
<instance part="R5" gate="G$1" x="710.565" y="617.22" rot="R180"/>
<instance part="R6" gate="G$1" x="711.2" y="597.535"/>
<instance part="R7" gate="G$1" x="633.095" y="581.66" rot="R90"/>
<instance part="U$14" gate="G$1" x="633.095" y="572.77"/>
<instance part="C8" gate="G$1" x="638.81" y="582.93" smashed="yes" rot="R180">
<attribute name="NAME" x="640.715" y="581.025" size="1.27" layer="95" font="vector"/>
<attribute name="VALUE" x="640.08" y="579.12" size="1.27" layer="96" font="vector"/>
</instance>
<instance part="U$15" gate="G$1" x="638.81" y="572.77"/>
<instance part="IC5" gate="G$1" x="636.905" y="685.165"/>
<instance part="U$16" gate="G$1" x="713.74" y="695.325" smashed="yes">
<attribute name="VALUE" x="709.168" y="700.405" size="1.778" layer="96" rot="R180"/>
<attribute name="NAME" x="709.168" y="702.945" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="U$16" gate="G$2" x="713.74" y="675.005"/>
<instance part="R9" gate="G$1" x="695.325" y="695.325"/>
<instance part="R10" gate="G$1" x="695.325" y="675.005"/>
<instance part="C9" gate="G$1" x="619.76" y="701.675" smashed="yes" rot="R90">
<attribute name="NAME" x="617.22" y="705.485" size="1.27" layer="95" font="vector" rot="R180"/>
<attribute name="VALUE" x="622.3" y="705.485" size="1.27" layer="96" font="vector" rot="R180"/>
</instance>
<instance part="U$17" gate="G$1" x="610.87" y="701.675" rot="R270"/>
<instance part="U$18" gate="G$1" x="650.24" y="666.115"/>
<instance part="U$19" gate="G$1" x="623.57" y="666.115"/>
<instance part="C10" gate="G$1" x="660.4" y="674.37" smashed="yes" rot="R180">
<attribute name="NAME" x="662.305" y="672.465" size="1.27" layer="95" font="vector"/>
<attribute name="VALUE" x="661.67" y="670.56" size="1.27" layer="96" font="vector"/>
</instance>
<instance part="U$20" gate="G$1" x="660.4" y="666.115"/>
<instance part="C11" gate="G$1" x="659.765" y="690.245" smashed="yes" rot="R270">
<attribute name="NAME" x="657.225" y="687.705" size="1.27" layer="95" font="vector"/>
<attribute name="VALUE" x="662.305" y="687.705" size="1.27" layer="96" font="vector"/>
</instance>
<instance part="R11" gate="G$1" x="678.18" y="667.385" smashed="yes" rot="R270">
<attribute name="NAME" x="680.212" y="669.925" size="1.27" layer="95" font="vector" rot="R270"/>
<attribute name="VALUE" x="674.37" y="672.465" size="1.27" layer="96" font="vector" rot="R270"/>
</instance>
<instance part="R12" gate="G$1" x="603.25" y="675.005" rot="R180"/>
<instance part="R13" gate="G$1" x="709.93" y="690.88" smashed="yes" rot="R180">
<attribute name="NAME" x="707.39" y="690.753" size="1.27" layer="95" font="vector" rot="R180"/>
<attribute name="VALUE" x="712.47" y="691.515" size="1.27" layer="96" font="vector" rot="R180"/>
</instance>
<instance part="R14" gate="G$1" x="709.93" y="670.56"/>
<instance part="R15" gate="G$1" x="655.32" y="655.32" rot="R90"/>
<instance part="U$22" gate="G$1" x="655.32" y="646.43"/>
<instance part="C12" gate="G$1" x="662.94" y="656.59" smashed="yes" rot="R180">
<attribute name="NAME" x="664.845" y="654.685" size="1.27" layer="95" font="vector"/>
<attribute name="VALUE" x="664.21" y="652.78" size="1.27" layer="96" font="vector"/>
</instance>
<instance part="U$23" gate="G$1" x="662.94" y="646.43"/>
<instance part="IC2" gate="G$1" x="639.445" y="782.955"/>
<instance part="U$10" gate="G$1" x="716.28" y="793.115"/>
<instance part="U$10" gate="G$2" x="716.28" y="772.795"/>
<instance part="R21" gate="G$1" x="694.69" y="793.115"/>
<instance part="R22" gate="G$1" x="694.055" y="772.795"/>
<instance part="U$24" gate="G$1" x="652.78" y="763.905"/>
<instance part="U$25" gate="G$1" x="626.11" y="763.905"/>
<instance part="C14" gate="G$1" x="662.94" y="772.16" smashed="yes" rot="R180">
<attribute name="NAME" x="664.845" y="770.255" size="1.27" layer="95" font="vector"/>
<attribute name="VALUE" x="664.21" y="768.35" size="1.27" layer="96" font="vector"/>
</instance>
<instance part="U$26" gate="G$1" x="662.94" y="763.905"/>
<instance part="C15" gate="G$1" x="662.305" y="788.035" smashed="yes" rot="R270">
<attribute name="NAME" x="659.765" y="785.495" size="1.27" layer="95" font="vector"/>
<attribute name="VALUE" x="664.845" y="785.495" size="1.27" layer="96" font="vector"/>
</instance>
<instance part="R23" gate="G$1" x="680.72" y="765.175" smashed="yes" rot="R270">
<attribute name="NAME" x="682.752" y="767.08" size="1.27" layer="95" font="vector" rot="R270"/>
<attribute name="VALUE" x="677.545" y="767.715" size="1.27" layer="96" font="vector" rot="R270"/>
</instance>
<instance part="R24" gate="G$1" x="605.79" y="772.795" rot="R180"/>
<instance part="R25" gate="G$1" x="712.47" y="788.67" rot="R180"/>
<instance part="R26" gate="G$1" x="713.105" y="768.35"/>
<instance part="R27" gate="G$1" x="666.75" y="752.475" rot="R90"/>
<instance part="U$28" gate="G$1" x="666.75" y="744.22"/>
<instance part="C16" gate="G$1" x="650.875" y="753.745" smashed="yes" rot="R180">
<attribute name="NAME" x="652.78" y="751.84" size="1.27" layer="95" font="vector"/>
<attribute name="VALUE" x="652.145" y="749.935" size="1.27" layer="96" font="vector"/>
</instance>
<instance part="U$29" gate="G$1" x="650.875" y="744.22"/>
<instance part="U$31" gate="G$1" x="730.25" y="510.54"/>
<instance part="R31" gate="G$1" x="730.25" y="534.67" smashed="yes" rot="R270">
<attribute name="NAME" x="717.55" y="535.813" size="1.27" layer="95" font="vector" rot="R180"/>
<attribute name="VALUE" x="713.74" y="532.765" size="1.27" layer="96" font="vector"/>
</instance>
<instance part="R32" gate="G$1" x="697.865" y="525.145" rot="R180"/>
<instance part="R33" gate="G$1" x="670.56" y="516.255" rot="R180"/>
<instance part="U$33" gate="G$1" x="660.4" y="516.89"/>
<instance part="R34" gate="G$1" x="635.635" y="527.685" smashed="yes" rot="R180">
<attribute name="NAME" x="637.54" y="530.733" size="1.27" layer="95" font="vector" rot="R180"/>
<attribute name="VALUE" x="638.175" y="528.32" size="1.27" layer="96" font="vector" rot="R180"/>
</instance>
<instance part="C18" gate="G$1" x="645.16" y="536.575" smashed="yes" rot="R180">
<attribute name="NAME" x="647.7" y="537.21" size="1.27" layer="95" font="vector"/>
<attribute name="VALUE" x="646.43" y="532.765" size="1.27" layer="96" font="vector"/>
</instance>
<instance part="U$34" gate="G$1" x="645.16" y="528.32"/>
<instance part="C19" gate="G$1" x="608.965" y="521.97" smashed="yes" rot="R180">
<attribute name="NAME" x="611.505" y="522.605" size="1.27" layer="95" font="vector"/>
<attribute name="VALUE" x="610.235" y="518.16" size="1.27" layer="96" font="vector"/>
</instance>
<instance part="U$35" gate="G$1" x="608.965" y="509.905"/>
<instance part="BLUEPILL-STM32F103C8T6_MODULE" gate="G$1" x="479.425" y="701.675" smashed="yes">
<attribute name="NAME1" x="459.105" y="732.155" size="1.778" layer="96"/>
</instance>
<instance part="U$37" gate="G$1" x="455.295" y="671.83"/>
<instance part="U$38" gate="G$1" x="518.795" y="724.535" rot="R90"/>
<instance part="R35" gate="G$1" x="736.6" y="841.375" smashed="yes" rot="R270">
<attribute name="NAME" x="738.632" y="843.28" size="1.27" layer="95" font="vector" rot="R270"/>
<attribute name="VALUE" x="732.79" y="843.28" size="1.27" layer="96" font="vector" rot="R270"/>
</instance>
<instance part="R36" gate="G$1" x="750.57" y="830.58" smashed="yes" rot="R270">
<attribute name="NAME" x="752.602" y="832.485" size="1.27" layer="95" font="vector" rot="R270"/>
<attribute name="VALUE" x="746.76" y="832.485" size="1.27" layer="96" font="vector" rot="R270"/>
</instance>
<instance part="U$39" gate="G$1" x="750.57" y="821.055"/>
<instance part="C20" gate="G$1" x="618.49" y="638.175" smashed="yes" rot="R90">
<attribute name="NAME" x="615.95" y="641.985" size="1.27" layer="95" font="vector" rot="R180"/>
<attribute name="VALUE" x="621.03" y="641.985" size="1.27" layer="96" font="vector" rot="R180"/>
</instance>
<instance part="D4" gate="G$1" x="596.9" y="626.11" smashed="yes" rot="R270">
<attribute name="NAME" x="599.44" y="628.65" size="1.27" layer="95" rot="R270"/>
<attribute name="VALUE" x="593.725" y="631.825" size="1.27" layer="96" rot="R270"/>
</instance>
<instance part="R37" gate="G$1" x="697.865" y="540.385"/>
<instance part="IC3" gate="G$1" x="553.085" y="740.41"/>
<instance part="U$41" gate="G$1" x="553.085" y="729.615"/>
<instance part="PHASE_A" gate="G$1" x="781.05" y="612.775"/>
<instance part="PHASE_B" gate="G$1" x="779.145" y="685.8"/>
<instance part="PHASE_C" gate="G$1" x="775.335" y="783.59"/>
<instance part="D1" gate="G$1" x="668.655" y="631.19" smashed="yes" rot="R270">
<attribute name="NAME" x="654.05" y="636.27" size="1.27" layer="95"/>
<attribute name="VALUE" x="654.05" y="634.365" size="1.27" layer="96"/>
</instance>
<instance part="J2" gate="1" x="669.925" y="601.98"/>
<instance part="C6" gate="G$1" x="730.25" y="633.095"/>
<instance part="J3" gate="1" x="676.275" y="695.325"/>
<instance part="J4" gate="1" x="678.18" y="675.005"/>
<instance part="J5" gate="1" x="690.88" y="685.8"/>
<instance part="D2" gate="G$1" x="668.02" y="704.215" smashed="yes" rot="R270">
<attribute name="NAME" x="661.035" y="709.295" size="1.27" layer="95"/>
<attribute name="VALUE" x="661.035" y="707.39" size="1.27" layer="96"/>
</instance>
<instance part="C7" gate="G$1" x="744.22" y="633.095"/>
<instance part="D3" gate="G$1" x="670.56" y="802.005" smashed="yes" rot="R270">
<attribute name="NAME" x="663.575" y="807.085" size="1.27" layer="95"/>
<attribute name="VALUE" x="663.575" y="805.18" size="1.27" layer="96"/>
</instance>
<instance part="C1" gate="G$1" x="692.785" y="841.375" rot="R180"/>
<instance part="C2" gate="G$1" x="708.025" y="841.375" rot="R180"/>
<instance part="U$2" gate="G$1" x="692.785" y="832.485"/>
<instance part="U$3" gate="G$1" x="708.025" y="832.485"/>
<instance part="C13" gate="G$1" x="679.45" y="841.375" rot="R180"/>
<instance part="U$4" gate="G$1" x="679.45" y="832.485"/>
<instance part="J9" gate="1" x="743.585" y="835.66"/>
<instance part="JP1" gate="A" x="532.13" y="693.42"/>
<instance part="U$8" gate="G$1" x="521.97" y="689.61"/>
<instance part="J11" gate="1" x="584.835" y="690.245"/>
<instance part="J14" gate="G$1" x="438.785" y="704.215" smashed="yes">
<attribute name="NAME" x="423.545" y="713.343" size="1.778" layer="95"/>
<attribute name="VALUE" x="440.055" y="699.135" size="1.778" layer="96"/>
</instance>
<instance part="J15" gate="G$1" x="502.285" y="701.675" smashed="yes" rot="R180">
<attribute name="NAME" x="520.065" y="707.787" size="1.778" layer="95" rot="R180"/>
<attribute name="VALUE" x="501.015" y="706.755" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="R8" gate="G$1" x="674.37" y="758.825" smashed="yes">
<attribute name="NAME" x="672.465" y="760.857" size="1.27" layer="95" font="vector"/>
<attribute name="VALUE" x="673.735" y="758.19" size="1.27" layer="96" font="vector"/>
</instance>
<instance part="R16" gate="G$1" x="593.09" y="777.875" rot="R180"/>
<instance part="IC4" gate="G$1" x="660.4" y="527.685" rot="MR0"/>
<instance part="J1" gate="1" x="584.2" y="607.06"/>
<instance part="R20" gate="G$1" x="655.955" y="588.01" smashed="yes" rot="R180">
<attribute name="NAME" x="653.415" y="586.613" size="1.27" layer="95" font="vector" rot="R180"/>
<attribute name="VALUE" x="656.59" y="588.645" size="1.27" layer="96" font="vector" rot="R180"/>
</instance>
<instance part="R28" gate="G$1" x="680.72" y="772.795" smashed="yes">
<attribute name="NAME" x="678.18" y="774.827" size="1.27" layer="95" font="vector"/>
<attribute name="VALUE" x="680.085" y="772.16" size="1.27" layer="96" font="vector"/>
</instance>
<instance part="R29" gate="G$1" x="687.07" y="534.67" rot="R270"/>
</instances>
<busses>
</busses>
<nets>
<net name="GND" class="0">
<segment>
<pinref part="U$5" gate="G$1" pin="GND"/>
<pinref part="C3" gate="G$1" pin="P$1"/>
<wire x1="614.045" y1="628.65" x2="614.68" y2="628.65" width="0.1524" layer="91"/>
<pinref part="C20" gate="G$1" pin="P$1"/>
<wire x1="614.68" y1="628.65" x2="615.315" y2="628.65" width="0.1524" layer="91"/>
<wire x1="613.41" y1="638.175" x2="612.775" y2="638.175" width="0.1524" layer="91"/>
<wire x1="612.775" y1="638.175" x2="612.775" y2="630.555" width="0.1524" layer="91"/>
<wire x1="612.775" y1="630.555" x2="614.68" y2="630.555" width="0.1524" layer="91"/>
<wire x1="614.68" y1="630.555" x2="614.68" y2="628.65" width="0.1524" layer="91"/>
<junction x="614.68" y="628.65"/>
</segment>
<segment>
<pinref part="IC1" gate="G$1" pin="COM"/>
<pinref part="U$6" gate="G$1" pin="GND"/>
<wire x1="650.24" y1="596.9" x2="650.875" y2="596.9" width="0.1524" layer="91"/>
<wire x1="650.875" y1="596.9" x2="650.875" y2="595.63" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U$7" gate="G$1" pin="GND"/>
<wire x1="624.205" y1="595.63" x2="624.205" y2="601.98" width="0.1524" layer="91"/>
<pinref part="IC1" gate="G$1" pin="VSS"/>
<wire x1="624.205" y1="601.98" x2="624.84" y2="601.98" width="0.1524" layer="91"/>
<pinref part="R4" gate="G$1" pin="1"/>
<wire x1="608.965" y1="601.98" x2="624.205" y2="601.98" width="0.1524" layer="91"/>
<junction x="624.205" y="601.98"/>
</segment>
<segment>
<pinref part="U$9" gate="G$1" pin="GND"/>
<pinref part="C4" gate="G$1" pin="P$1"/>
<wire x1="661.035" y1="595.63" x2="661.035" y2="596.265" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U$14" gate="G$1" pin="GND"/>
<pinref part="R7" gate="G$1" pin="1"/>
<wire x1="633.095" y1="575.31" x2="633.095" y2="576.58" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U$15" gate="G$1" pin="GND"/>
<pinref part="C8" gate="G$1" pin="P$1"/>
<wire x1="638.81" y1="575.31" x2="638.81" y2="577.85" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U$17" gate="G$1" pin="GND"/>
<pinref part="C9" gate="G$1" pin="P$1"/>
<wire x1="613.41" y1="701.675" x2="614.68" y2="701.675" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="IC5" gate="G$1" pin="COM"/>
<pinref part="U$18" gate="G$1" pin="GND"/>
<wire x1="649.605" y1="669.925" x2="650.24" y2="669.925" width="0.1524" layer="91"/>
<wire x1="650.24" y1="669.925" x2="650.24" y2="668.655" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U$19" gate="G$1" pin="GND"/>
<wire x1="623.57" y1="668.655" x2="623.57" y2="675.005" width="0.1524" layer="91"/>
<pinref part="IC5" gate="G$1" pin="VSS"/>
<wire x1="623.57" y1="675.005" x2="624.205" y2="675.005" width="0.1524" layer="91"/>
<pinref part="R12" gate="G$1" pin="1"/>
<wire x1="608.33" y1="675.005" x2="623.57" y2="675.005" width="0.1524" layer="91"/>
<junction x="623.57" y="675.005"/>
</segment>
<segment>
<pinref part="U$20" gate="G$1" pin="GND"/>
<pinref part="C10" gate="G$1" pin="P$1"/>
<wire x1="660.4" y1="668.655" x2="660.4" y2="669.29" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U$22" gate="G$1" pin="GND"/>
<pinref part="R15" gate="G$1" pin="1"/>
<wire x1="655.32" y1="648.97" x2="655.32" y2="650.24" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U$23" gate="G$1" pin="GND"/>
<pinref part="C12" gate="G$1" pin="P$1"/>
<wire x1="662.94" y1="648.97" x2="662.94" y2="651.51" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="COM"/>
<pinref part="U$24" gate="G$1" pin="GND"/>
<wire x1="652.145" y1="767.715" x2="652.78" y2="767.715" width="0.1524" layer="91"/>
<wire x1="652.78" y1="767.715" x2="652.78" y2="766.445" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U$25" gate="G$1" pin="GND"/>
<wire x1="626.11" y1="766.445" x2="626.11" y2="772.795" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="VSS"/>
<wire x1="626.11" y1="772.795" x2="626.745" y2="772.795" width="0.1524" layer="91"/>
<pinref part="R24" gate="G$1" pin="1"/>
<wire x1="610.87" y1="772.795" x2="626.11" y2="772.795" width="0.1524" layer="91"/>
<junction x="626.11" y="772.795"/>
</segment>
<segment>
<pinref part="U$26" gate="G$1" pin="GND"/>
<pinref part="C14" gate="G$1" pin="P$1"/>
<wire x1="662.94" y1="766.445" x2="662.94" y2="767.08" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U$28" gate="G$1" pin="GND"/>
<pinref part="R27" gate="G$1" pin="1"/>
<wire x1="666.75" y1="746.76" x2="666.75" y2="747.395" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U$29" gate="G$1" pin="GND"/>
<pinref part="C16" gate="G$1" pin="P$1"/>
<wire x1="650.875" y1="746.76" x2="650.875" y2="748.665" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="R31" gate="G$1" pin="2"/>
<pinref part="U$31" gate="G$1" pin="GND"/>
<wire x1="730.25" y1="529.59" x2="730.25" y2="525.145" width="0.1524" layer="91"/>
<pinref part="R32" gate="G$1" pin="1"/>
<wire x1="730.25" y1="525.145" x2="730.25" y2="513.08" width="0.1524" layer="91"/>
<wire x1="702.945" y1="525.145" x2="708.66" y2="525.145" width="0.1524" layer="91"/>
<junction x="730.25" y="525.145"/>
<pinref part="R29" gate="G$1" pin="2"/>
<wire x1="708.66" y1="525.145" x2="730.25" y2="525.145" width="0.1524" layer="91"/>
<wire x1="687.07" y1="529.59" x2="687.07" y2="528.955" width="0.1524" layer="91"/>
<wire x1="687.07" y1="528.955" x2="708.66" y2="528.955" width="0.1524" layer="91"/>
<wire x1="708.66" y1="528.955" x2="708.66" y2="525.145" width="0.1524" layer="91"/>
<junction x="708.66" y="525.145"/>
</segment>
<segment>
<pinref part="U$34" gate="G$1" pin="GND"/>
<pinref part="C18" gate="G$1" pin="P$1"/>
<wire x1="645.16" y1="530.86" x2="645.16" y2="531.495" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U$35" gate="G$1" pin="GND"/>
<pinref part="C19" gate="G$1" pin="P$1"/>
<wire x1="608.965" y1="512.445" x2="608.965" y2="516.89" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="BLUEPILL-STM32F103C8T6_MODULE" gate="G$1" pin="GND/2"/>
<wire x1="459.105" y1="678.815" x2="455.295" y2="678.815" width="0.1524" layer="91"/>
<wire x1="455.295" y1="678.815" x2="455.295" y2="674.37" width="0.1524" layer="91"/>
<pinref part="BLUEPILL-STM32F103C8T6_MODULE" gate="G$1" pin="GND/1"/>
<wire x1="459.105" y1="681.355" x2="455.295" y2="681.355" width="0.1524" layer="91"/>
<wire x1="455.295" y1="681.355" x2="455.295" y2="678.815" width="0.1524" layer="91"/>
<junction x="455.295" y="678.815"/>
<pinref part="U$37" gate="G$1" pin="GND"/>
<pinref part="J14" gate="G$1" pin="19"/>
<wire x1="455.295" y1="681.355" x2="431.165" y2="681.355" width="0.1524" layer="91"/>
<junction x="455.295" y="681.355"/>
<pinref part="J14" gate="G$1" pin="20"/>
<wire x1="431.165" y1="678.815" x2="455.295" y2="678.815" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="BLUEPILL-STM32F103C8T6_MODULE" gate="G$1" pin="GND/3"/>
<wire x1="502.285" y1="724.535" x2="509.905" y2="724.535" width="0.1524" layer="91"/>
<pinref part="U$38" gate="G$1" pin="GND"/>
<pinref part="J15" gate="G$1" pin="19"/>
<wire x1="509.905" y1="724.535" x2="516.255" y2="724.535" width="0.1524" layer="91"/>
<junction x="509.905" y="724.535"/>
</segment>
<segment>
<pinref part="U$39" gate="G$1" pin="GND"/>
<pinref part="R36" gate="G$1" pin="2"/>
<wire x1="750.57" y1="823.595" x2="750.57" y2="825.5" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U$41" gate="G$1" pin="GND"/>
<pinref part="IC3" gate="G$1" pin="GND"/>
<wire x1="553.085" y1="732.155" x2="553.085" y2="732.79" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U$2" gate="G$1" pin="GND"/>
<pinref part="C1" gate="G$1" pin="P$1"/>
<wire x1="692.785" y1="835.025" x2="692.785" y2="836.295" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U$3" gate="G$1" pin="GND"/>
<pinref part="C2" gate="G$1" pin="P$1"/>
<wire x1="708.025" y1="835.025" x2="708.025" y2="836.295" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="C13" gate="G$1" pin="P$1"/>
<pinref part="U$4" gate="G$1" pin="GND"/>
<wire x1="679.45" y1="836.295" x2="679.45" y2="835.025" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U$8" gate="G$1" pin="GND"/>
<wire x1="521.97" y1="692.15" x2="521.97" y2="693.42" width="0.1524" layer="91"/>
<pinref part="JP1" gate="A" pin="3"/>
<wire x1="521.97" y1="693.42" x2="529.59" y2="693.42" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U$33" gate="G$1" pin="GND"/>
<pinref part="IC4" gate="G$1" pin="V-"/>
<wire x1="660.4" y1="519.43" x2="660.4" y2="520.065" width="0.1524" layer="91"/>
</segment>
</net>
<net name="V_MOTOR" class="0">
<segment>
<wire x1="716.915" y1="847.09" x2="708.025" y2="847.09" width="0.1524" layer="91"/>
<pinref part="V_MOTOR" gate="G$1" pin="1"/>
<wire x1="708.025" y1="847.09" x2="692.785" y2="847.09" width="0.1524" layer="91"/>
<wire x1="692.785" y1="847.09" x2="679.45" y2="847.09" width="0.1524" layer="91"/>
<wire x1="716.915" y1="862.33" x2="716.915" y2="847.09" width="0.1524" layer="91"/>
<label x="718.82" y="861.06" size="1.778" layer="95"/>
<junction x="716.915" y="847.09"/>
<pinref part="R35" gate="G$1" pin="1"/>
<wire x1="736.6" y1="846.455" x2="736.6" y2="847.09" width="0.1524" layer="91"/>
<wire x1="736.6" y1="847.09" x2="716.915" y2="847.09" width="0.1524" layer="91"/>
<pinref part="C13" gate="G$1" pin="P$2"/>
<wire x1="679.45" y1="843.915" x2="679.45" y2="847.09" width="0.1524" layer="91"/>
<pinref part="C1" gate="G$1" pin="P$2"/>
<wire x1="692.785" y1="843.915" x2="692.785" y2="847.09" width="0.1524" layer="91"/>
<junction x="692.785" y="847.09"/>
<pinref part="C2" gate="G$1" pin="P$2"/>
<wire x1="708.025" y1="843.915" x2="708.025" y2="847.09" width="0.1524" layer="91"/>
<junction x="708.025" y="847.09"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="VCC"/>
<wire x1="652.145" y1="777.875" x2="662.94" y2="777.875" width="0.1524" layer="91"/>
<label x="652.78" y="778.51" size="1.778" layer="95"/>
<pinref part="C14" gate="G$1" pin="P$2"/>
<wire x1="662.94" y1="774.7" x2="662.94" y2="777.875" width="0.1524" layer="91"/>
<junction x="662.94" y="777.875"/>
<wire x1="662.94" y1="777.875" x2="678.815" y2="777.875" width="0.1524" layer="91"/>
<wire x1="678.815" y1="777.875" x2="678.815" y2="810.895" width="0.1524" layer="91"/>
<wire x1="670.56" y1="804.545" x2="670.56" y2="810.895" width="0.1524" layer="91"/>
<wire x1="670.56" y1="810.895" x2="678.815" y2="810.895" width="0.1524" layer="91"/>
<junction x="678.815" y="810.895"/>
<pinref part="D3" gate="G$1" pin="A"/>
<pinref part="U$10" gate="G$1" pin="D@1"/>
<wire x1="721.36" y1="802.64" x2="721.36" y2="800.735" width="0.1524" layer="91"/>
<wire x1="718.82" y1="800.735" x2="718.82" y2="802.64" width="0.1524" layer="91"/>
<wire x1="718.82" y1="802.64" x2="721.36" y2="802.64" width="0.1524" layer="91"/>
<label x="720.09" y="810.895" size="1.778" layer="95" rot="R90"/>
<pinref part="U$10" gate="G$1" pin="D@2"/>
<wire x1="721.36" y1="802.64" x2="721.36" y2="810.895" width="0.1524" layer="91"/>
<junction x="721.36" y="802.64"/>
<wire x1="678.815" y1="810.895" x2="716.915" y2="810.895" width="0.1524" layer="91"/>
<wire x1="716.915" y1="810.895" x2="721.36" y2="810.895" width="0.1524" layer="91"/>
<wire x1="716.915" y1="846.455" x2="716.915" y2="810.895" width="0.1524" layer="91"/>
<junction x="716.915" y="810.895"/>
</segment>
<segment>
<pinref part="IC5" gate="G$1" pin="VCC"/>
<wire x1="649.605" y1="680.085" x2="660.4" y2="680.085" width="0.1524" layer="91"/>
<label x="650.24" y="680.72" size="1.778" layer="95"/>
<pinref part="C10" gate="G$1" pin="P$2"/>
<wire x1="660.4" y1="676.91" x2="660.4" y2="680.085" width="0.1524" layer="91"/>
<junction x="660.4" y="680.085"/>
<wire x1="660.4" y1="680.085" x2="676.275" y2="680.085" width="0.1524" layer="91"/>
<wire x1="676.275" y1="680.085" x2="676.275" y2="711.835" width="0.1524" layer="91"/>
<wire x1="668.02" y1="706.755" x2="668.02" y2="711.835" width="0.1524" layer="91"/>
<wire x1="668.02" y1="711.835" x2="676.275" y2="711.835" width="0.1524" layer="91"/>
<wire x1="676.275" y1="711.835" x2="676.275" y2="727.71" width="0.1524" layer="91"/>
<junction x="676.275" y="711.835"/>
<pinref part="D2" gate="G$1" pin="A"/>
<pinref part="U$16" gate="G$1" pin="D@1"/>
<wire x1="718.82" y1="704.85" x2="718.82" y2="702.945" width="0.1524" layer="91"/>
<wire x1="716.28" y1="702.945" x2="716.28" y2="704.85" width="0.1524" layer="91"/>
<wire x1="716.28" y1="704.85" x2="718.82" y2="704.85" width="0.1524" layer="91"/>
<label x="717.55" y="713.105" size="1.778" layer="95" rot="R90"/>
<pinref part="U$16" gate="G$1" pin="D@2"/>
<wire x1="718.82" y1="704.85" x2="718.82" y2="727.71" width="0.1524" layer="91"/>
<junction x="718.82" y="704.85"/>
<wire x1="718.82" y1="727.71" x2="676.275" y2="727.71" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="IC3" gate="G$1" pin="VI"/>
<wire x1="545.465" y1="740.41" x2="516.89" y2="740.41" width="0.1524" layer="91"/>
<label x="517.525" y="741.045" size="1.778" layer="95"/>
<wire x1="516.89" y1="740.41" x2="516.89" y2="741.045" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="D1" gate="G$1" pin="A"/>
<wire x1="668.655" y1="633.73" x2="668.655" y2="639.445" width="0.1524" layer="91"/>
<wire x1="668.655" y1="639.445" x2="676.91" y2="639.445" width="0.1524" layer="91"/>
<pinref part="IC1" gate="G$1" pin="VCC"/>
<wire x1="650.24" y1="607.06" x2="661.035" y2="607.06" width="0.1524" layer="91"/>
<pinref part="C4" gate="G$1" pin="P$2"/>
<wire x1="661.035" y1="603.885" x2="661.035" y2="607.06" width="0.1524" layer="91"/>
<junction x="661.035" y="607.06"/>
<wire x1="661.035" y1="607.06" x2="676.91" y2="607.06" width="0.1524" layer="91"/>
<wire x1="676.91" y1="607.06" x2="676.91" y2="639.445" width="0.1524" layer="91"/>
<label x="650.875" y="607.695" size="1.778" layer="95"/>
<pinref part="U$1" gate="G$1" pin="D@1"/>
<wire x1="716.915" y1="629.92" x2="716.915" y2="631.825" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="D@2"/>
<wire x1="719.455" y1="629.92" x2="719.455" y2="631.825" width="0.1524" layer="91"/>
<junction x="719.455" y="631.825"/>
<pinref part="C7" gate="G$1" pin="P$1"/>
<wire x1="744.22" y1="639.445" x2="744.22" y2="638.175" width="0.1524" layer="91"/>
<pinref part="C6" gate="G$1" pin="P$1"/>
<wire x1="730.25" y1="639.445" x2="730.25" y2="638.175" width="0.1524" layer="91"/>
<wire x1="730.25" y1="639.445" x2="744.22" y2="639.445" width="0.1524" layer="91"/>
<junction x="730.25" y="639.445"/>
<wire x1="719.455" y1="639.445" x2="730.25" y2="639.445" width="0.1524" layer="91"/>
<wire x1="719.455" y1="639.445" x2="719.455" y2="631.825" width="0.1524" layer="91"/>
<wire x1="719.455" y1="631.825" x2="716.915" y2="631.825" width="0.1524" layer="91"/>
<label x="727.075" y="643.255" size="1.778" layer="95" rot="R180"/>
<wire x1="719.455" y1="639.445" x2="676.91" y2="639.445" width="0.1524" layer="91"/>
<junction x="719.455" y="639.445"/>
<junction x="676.91" y="639.445"/>
</segment>
</net>
<net name="N$1" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="G"/>
<wire x1="709.295" y1="622.3" x2="705.485" y2="622.3" width="0.1524" layer="91"/>
<pinref part="R1" gate="G$1" pin="2"/>
<pinref part="R5" gate="G$1" pin="2"/>
<wire x1="705.485" y1="622.3" x2="701.675" y2="622.3" width="0.1524" layer="91"/>
<wire x1="705.485" y1="617.22" x2="705.485" y2="622.3" width="0.1524" layer="91"/>
<junction x="705.485" y="622.3"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="U$1" gate="G$2" pin="G"/>
<wire x1="709.295" y1="601.98" x2="706.12" y2="601.98" width="0.1524" layer="91"/>
<wire x1="706.12" y1="601.98" x2="701.675" y2="601.98" width="0.1524" layer="91"/>
<pinref part="R2" gate="G$1" pin="2"/>
<pinref part="R6" gate="G$1" pin="1"/>
<wire x1="706.12" y1="597.535" x2="706.12" y2="601.98" width="0.1524" layer="91"/>
<junction x="706.12" y="601.98"/>
</segment>
</net>
<net name="VDD_LOGIC_4.4V" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="VDD"/>
<wire x1="624.84" y1="622.3" x2="596.9" y2="622.3" width="0.1524" layer="91"/>
<label x="600.075" y="622.935" size="1.778" layer="95"/>
<pinref part="C3" gate="G$1" pin="P$2"/>
<wire x1="622.935" y1="628.65" x2="624.84" y2="628.65" width="0.1524" layer="91"/>
<wire x1="624.84" y1="628.65" x2="624.84" y2="622.3" width="0.1524" layer="91"/>
<junction x="624.84" y="622.3"/>
<pinref part="C20" gate="G$1" pin="P$2"/>
<wire x1="621.03" y1="638.175" x2="624.84" y2="638.175" width="0.1524" layer="91"/>
<wire x1="624.84" y1="638.175" x2="624.84" y2="628.65" width="0.1524" layer="91"/>
<junction x="624.84" y="628.65"/>
<pinref part="D4" gate="G$1" pin="C"/>
<wire x1="596.9" y1="623.57" x2="596.9" y2="622.3" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="IC5" gate="G$1" pin="VDD"/>
<wire x1="624.205" y1="695.325" x2="597.535" y2="695.325" width="0.1524" layer="91"/>
<label x="599.44" y="695.96" size="1.778" layer="95"/>
<pinref part="C9" gate="G$1" pin="P$2"/>
<wire x1="622.3" y1="701.675" x2="624.205" y2="701.675" width="0.1524" layer="91"/>
<wire x1="624.205" y1="701.675" x2="624.205" y2="695.325" width="0.1524" layer="91"/>
<junction x="624.205" y="695.325"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="VDD"/>
<wire x1="626.745" y1="793.115" x2="600.075" y2="793.115" width="0.1524" layer="91"/>
<label x="601.98" y="793.75" size="1.778" layer="95"/>
</segment>
</net>
<net name="!SHDN_C_" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="!SD"/>
<wire x1="624.84" y1="612.14" x2="596.9" y2="612.14" width="0.1524" layer="91"/>
<label x="613.41" y="612.775" size="1.778" layer="95"/>
<wire x1="596.9" y1="612.14" x2="596.9" y2="601.98" width="0.1524" layer="91"/>
<pinref part="R4" gate="G$1" pin="2"/>
<wire x1="596.9" y1="601.98" x2="598.805" y2="601.98" width="0.1524" layer="91"/>
</segment>
</net>
<net name="HS_FL.SUP_C_" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="VB"/>
<wire x1="650.24" y1="627.38" x2="668.655" y2="627.38" width="0.1524" layer="91"/>
<label x="650.24" y="628.015" size="1.4224" layer="95"/>
<pinref part="C5" gate="G$1" pin="P$1"/>
<wire x1="665.48" y1="617.22" x2="668.655" y2="617.22" width="0.1524" layer="91"/>
<wire x1="668.655" y1="617.22" x2="668.655" y2="627.38" width="0.1524" layer="91"/>
<wire x1="668.655" y1="627.38" x2="668.655" y2="628.65" width="0.1524" layer="91"/>
<junction x="668.655" y="627.38"/>
<pinref part="D1" gate="G$1" pin="C"/>
</segment>
</net>
<net name="PHASE_C" class="0">
<segment>
<pinref part="C5" gate="G$1" pin="P$2"/>
<pinref part="IC1" gate="G$1" pin="VS"/>
<wire x1="650.24" y1="617.22" x2="655.32" y2="617.22" width="0.1524" layer="91"/>
<wire x1="655.32" y1="617.22" x2="657.86" y2="617.22" width="0.1524" layer="91"/>
<junction x="655.32" y="617.22"/>
<wire x1="655.32" y1="617.22" x2="655.32" y2="612.775" width="0.1524" layer="91"/>
<label x="650.24" y="617.855" size="1.4224" layer="95"/>
<pinref part="U$1" gate="G$2" pin="D@1"/>
<wire x1="716.915" y1="609.6" x2="716.915" y2="610.235" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$2" pin="D@2"/>
<wire x1="716.915" y1="610.235" x2="719.455" y2="610.235" width="0.1524" layer="91"/>
<wire x1="719.455" y1="610.235" x2="719.455" y2="609.6" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="S"/>
<wire x1="716.915" y1="619.76" x2="716.915" y2="617.22" width="0.1524" layer="91"/>
<junction x="716.915" y="610.235"/>
<wire x1="716.915" y1="617.22" x2="716.915" y2="612.775" width="0.1524" layer="91"/>
<pinref part="R5" gate="G$1" pin="1"/>
<wire x1="716.915" y1="612.775" x2="716.915" y2="610.235" width="0.1524" layer="91"/>
<wire x1="715.645" y1="617.22" x2="716.915" y2="617.22" width="0.1524" layer="91"/>
<junction x="716.915" y="617.22"/>
<wire x1="655.32" y1="612.775" x2="678.815" y2="612.775" width="0.1524" layer="91"/>
<junction x="716.915" y="612.775"/>
<pinref part="R3" gate="G$1" pin="1"/>
<wire x1="678.815" y1="612.775" x2="716.915" y2="612.775" width="0.1524" layer="91"/>
<wire x1="678.815" y1="599.44" x2="678.815" y2="612.775" width="0.1524" layer="91"/>
<junction x="678.815" y="612.775"/>
<pinref part="PHASE_A" gate="G$1" pin="1"/>
<wire x1="781.05" y1="612.775" x2="716.915" y2="612.775" width="0.1524" layer="91"/>
<label x="725.805" y="614.045" size="1.778" layer="95"/>
</segment>
</net>
<net name="BEMF_PHASE_A" class="0">
<segment>
<pinref part="BLUEPILL-STM32F103C8T6_MODULE" gate="G$1" pin="PA1/A7"/>
<wire x1="459.105" y1="714.375" x2="440.055" y2="714.375" width="0.1524" layer="91"/>
<label x="440.69" y="714.375" size="1.27" layer="95"/>
<wire x1="440.055" y1="714.375" x2="440.055" y2="715.01" width="0.1524" layer="91"/>
<pinref part="J14" gate="G$1" pin="6"/>
<wire x1="440.055" y1="714.375" x2="431.165" y2="714.375" width="0.1524" layer="91"/>
<junction x="440.055" y="714.375"/>
</segment>
<segment>
<pinref part="R27" gate="G$1" pin="2"/>
<wire x1="666.75" y1="757.555" x2="666.75" y2="758.825" width="0.1524" layer="91"/>
<wire x1="666.75" y1="758.825" x2="650.875" y2="758.825" width="0.1524" layer="91"/>
<pinref part="C16" gate="G$1" pin="P$2"/>
<wire x1="650.875" y1="758.825" x2="650.875" y2="756.285" width="0.1524" layer="91"/>
<wire x1="650.875" y1="758.825" x2="598.805" y2="758.825" width="0.1524" layer="91"/>
<junction x="650.875" y="758.825"/>
<label x="607.695" y="759.46" size="1.4224" layer="95"/>
<pinref part="R8" gate="G$1" pin="1"/>
<wire x1="669.29" y1="758.825" x2="666.75" y2="758.825" width="0.1524" layer="91"/>
<junction x="666.75" y="758.825"/>
</segment>
</net>
<net name="A_LOW" class="0">
<segment>
<label x="440.69" y="699.135" size="1.27" layer="95"/>
<pinref part="BLUEPILL-STM32F103C8T6_MODULE" gate="G$1" pin="PA7/A1/M0SI1"/>
<wire x1="459.105" y1="699.135" x2="431.165" y2="699.135" width="0.1524" layer="91"/>
<pinref part="J14" gate="G$1" pin="12"/>
</segment>
<segment>
<label x="573.405" y="777.875" size="1.778" layer="95"/>
<pinref part="R16" gate="G$1" pin="2"/>
<wire x1="588.01" y1="777.875" x2="564.515" y2="777.875" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<pinref part="U$16" gate="G$1" pin="G"/>
<wire x1="708.66" y1="695.325" x2="702.945" y2="695.325" width="0.1524" layer="91"/>
<pinref part="R9" gate="G$1" pin="2"/>
<pinref part="R13" gate="G$1" pin="2"/>
<wire x1="702.945" y1="695.325" x2="700.405" y2="695.325" width="0.1524" layer="91"/>
<wire x1="704.85" y1="690.88" x2="702.945" y2="690.88" width="0.1524" layer="91"/>
<wire x1="702.945" y1="690.88" x2="702.945" y2="695.325" width="0.1524" layer="91"/>
<junction x="702.945" y="695.325"/>
</segment>
</net>
<net name="N$11" class="0">
<segment>
<pinref part="U$16" gate="G$2" pin="G"/>
<wire x1="708.66" y1="675.005" x2="702.945" y2="675.005" width="0.1524" layer="91"/>
<pinref part="R10" gate="G$1" pin="2"/>
<wire x1="702.945" y1="675.005" x2="700.405" y2="675.005" width="0.1524" layer="91"/>
<pinref part="R14" gate="G$1" pin="1"/>
<wire x1="704.85" y1="670.56" x2="702.945" y2="670.56" width="0.1524" layer="91"/>
<wire x1="702.945" y1="670.56" x2="702.945" y2="675.005" width="0.1524" layer="91"/>
<junction x="702.945" y="675.005"/>
</segment>
</net>
<net name="B_HIGH" class="0">
<segment>
<pinref part="BLUEPILL-STM32F103C8T6_MODULE" gate="G$1" pin="PB7/SDA1"/>
<wire x1="502.285" y1="714.375" x2="509.905" y2="714.375" width="0.1524" layer="91"/>
<label x="511.175" y="714.375" size="1.27" layer="95"/>
<pinref part="J15" gate="G$1" pin="15"/>
<wire x1="509.905" y1="714.375" x2="523.875" y2="714.375" width="0.1524" layer="91"/>
<junction x="509.905" y="714.375"/>
</segment>
<segment>
<pinref part="J11" gate="1" pin="1"/>
<wire x1="579.755" y1="690.245" x2="567.69" y2="690.245" width="0.1524" layer="91"/>
<label x="568.96" y="690.88" size="1.778" layer="95"/>
</segment>
</net>
<net name="BEMF_PHASE_B" class="0">
<segment>
<pinref part="C12" gate="G$1" pin="P$2"/>
<wire x1="662.94" y1="661.035" x2="662.94" y2="659.13" width="0.1524" layer="91"/>
<wire x1="662.94" y1="661.035" x2="655.32" y2="661.035" width="0.1524" layer="91"/>
<label x="605.155" y="661.67" size="1.4224" layer="95"/>
<pinref part="R15" gate="G$1" pin="2"/>
<wire x1="655.32" y1="661.035" x2="596.265" y2="661.035" width="0.1524" layer="91"/>
<wire x1="655.32" y1="660.4" x2="655.32" y2="661.035" width="0.1524" layer="91"/>
<junction x="655.32" y="661.035"/>
<junction x="662.94" y="661.035"/>
<pinref part="R11" gate="G$1" pin="2"/>
<wire x1="678.18" y1="661.035" x2="678.18" y2="662.305" width="0.1524" layer="91"/>
<wire x1="662.94" y1="661.035" x2="678.18" y2="661.035" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="BLUEPILL-STM32F103C8T6_MODULE" gate="G$1" pin="PA2/A6/TX2"/>
<wire x1="459.105" y1="711.835" x2="440.055" y2="711.835" width="0.1524" layer="91"/>
<wire x1="440.055" y1="711.835" x2="440.055" y2="712.47" width="0.1524" layer="91"/>
<label x="440.69" y="711.835" size="1.27" layer="95"/>
<pinref part="J14" gate="G$1" pin="7"/>
<wire x1="440.055" y1="711.835" x2="431.165" y2="711.835" width="0.1524" layer="91"/>
<junction x="440.055" y="711.835"/>
</segment>
</net>
<net name="!SHDN_B" class="0">
<segment>
<pinref part="IC5" gate="G$1" pin="!SD"/>
<wire x1="624.205" y1="685.165" x2="596.265" y2="685.165" width="0.1524" layer="91"/>
<label x="612.775" y="685.8" size="1.778" layer="95"/>
<wire x1="596.265" y1="685.165" x2="596.265" y2="675.005" width="0.1524" layer="91"/>
<pinref part="R12" gate="G$1" pin="2"/>
<wire x1="596.265" y1="675.005" x2="598.17" y2="675.005" width="0.1524" layer="91"/>
</segment>
</net>
<net name="HS_FL.SUP_B" class="0">
<segment>
<pinref part="IC5" gate="G$1" pin="VB"/>
<wire x1="649.605" y1="700.405" x2="668.02" y2="700.405" width="0.1524" layer="91"/>
<label x="649.605" y="701.04" size="1.4224" layer="95"/>
<pinref part="C11" gate="G$1" pin="P$1"/>
<wire x1="664.845" y1="690.245" x2="668.02" y2="690.245" width="0.1524" layer="91"/>
<wire x1="668.02" y1="690.245" x2="668.02" y2="700.405" width="0.1524" layer="91"/>
<wire x1="668.02" y1="700.405" x2="668.02" y2="701.675" width="0.1524" layer="91"/>
<junction x="668.02" y="700.405"/>
<pinref part="D2" gate="G$1" pin="C"/>
</segment>
</net>
<net name="PHASE_B" class="0">
<segment>
<pinref part="U$16" gate="G$1" pin="S"/>
<wire x1="716.28" y1="692.785" x2="716.28" y2="690.88" width="0.1524" layer="91"/>
<wire x1="716.28" y1="690.88" x2="716.28" y2="685.8" width="0.1524" layer="91"/>
<pinref part="R13" gate="G$1" pin="1"/>
<wire x1="715.01" y1="690.88" x2="716.28" y2="690.88" width="0.1524" layer="91"/>
<junction x="716.28" y="690.88"/>
<junction x="716.28" y="685.8"/>
<wire x1="716.28" y1="685.8" x2="779.145" y2="685.8" width="0.1524" layer="91"/>
<pinref part="PHASE_B" gate="G$1" pin="1"/>
<label x="740.41" y="687.705" size="1.778" layer="95"/>
<pinref part="J5" gate="1" pin="2"/>
<wire x1="695.96" y1="685.8" x2="716.28" y2="685.8" width="0.1524" layer="91"/>
<pinref part="U$16" gate="G$2" pin="D@1"/>
<wire x1="716.28" y1="682.625" x2="716.28" y2="683.26" width="0.1524" layer="91"/>
<wire x1="716.28" y1="683.26" x2="718.82" y2="683.26" width="0.1524" layer="91"/>
<pinref part="U$16" gate="G$2" pin="D@2"/>
<wire x1="718.82" y1="683.26" x2="718.82" y2="682.625" width="0.1524" layer="91"/>
<wire x1="716.28" y1="683.26" x2="716.28" y2="685.8" width="0.1524" layer="91"/>
<junction x="716.28" y="683.26"/>
</segment>
</net>
<net name="TOT_CURRENT" class="0">
<segment>
<wire x1="716.915" y1="577.215" x2="719.455" y2="577.215" width="0.1524" layer="91"/>
<wire x1="719.455" y1="577.215" x2="719.455" y2="579.755" width="0.1524" layer="91"/>
<wire x1="719.455" y1="579.755" x2="716.915" y2="579.755" width="0.1524" layer="91"/>
<wire x1="716.915" y1="577.215" x2="716.915" y2="573.405" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$2" pin="S"/>
<wire x1="716.915" y1="599.44" x2="716.915" y2="597.535" width="0.1524" layer="91"/>
<pinref part="R6" gate="G$1" pin="2"/>
<wire x1="716.915" y1="597.535" x2="716.915" y2="579.755" width="0.1524" layer="91"/>
<wire x1="716.28" y1="597.535" x2="716.915" y2="597.535" width="0.1524" layer="91"/>
<junction x="716.915" y="597.535"/>
<wire x1="716.915" y1="573.405" x2="730.25" y2="573.405" width="0.1524" layer="91"/>
<wire x1="730.25" y1="573.405" x2="730.25" y2="626.745" width="0.1524" layer="91"/>
<pinref part="C6" gate="G$1" pin="P$2"/>
<wire x1="730.25" y1="626.745" x2="730.25" y2="630.555" width="0.1524" layer="91"/>
<junction x="730.25" y="626.745"/>
<label x="735.33" y="541.02" size="1.778" layer="95" rot="R90"/>
<wire x1="716.915" y1="573.405" x2="716.28" y2="573.405" width="0.1524" layer="91"/>
<junction x="716.915" y="573.405"/>
<pinref part="U$16" gate="G$2" pin="S"/>
<wire x1="716.28" y1="670.56" x2="716.28" y2="672.465" width="0.1524" layer="91"/>
<pinref part="R14" gate="G$1" pin="2"/>
<wire x1="715.01" y1="670.56" x2="716.28" y2="670.56" width="0.1524" layer="91"/>
<wire x1="716.28" y1="670.56" x2="716.28" y2="661.035" width="0.1524" layer="91"/>
<junction x="716.28" y="670.56"/>
<wire x1="716.28" y1="661.035" x2="718.185" y2="661.035" width="0.1524" layer="91"/>
<wire x1="718.185" y1="661.035" x2="718.185" y2="657.86" width="0.1524" layer="91"/>
<wire x1="718.185" y1="657.86" x2="716.28" y2="657.86" width="0.1524" layer="91"/>
<wire x1="716.28" y1="657.86" x2="716.28" y2="654.05" width="0.1524" layer="91"/>
<wire x1="716.28" y1="654.05" x2="758.19" y2="654.05" width="0.1524" layer="91"/>
<wire x1="758.19" y1="654.05" x2="758.19" y2="626.745" width="0.1524" layer="91"/>
<wire x1="758.19" y1="626.745" x2="744.22" y2="626.745" width="0.1524" layer="91"/>
<pinref part="U$10" gate="G$2" pin="S"/>
<wire x1="744.22" y1="626.745" x2="730.25" y2="626.745" width="0.1524" layer="91"/>
<wire x1="718.82" y1="770.255" x2="718.82" y2="768.35" width="0.1524" layer="91"/>
<pinref part="R26" gate="G$1" pin="2"/>
<wire x1="718.185" y1="768.35" x2="718.82" y2="768.35" width="0.1524" layer="91"/>
<junction x="718.82" y="768.35"/>
<wire x1="718.82" y1="768.35" x2="718.82" y2="748.665" width="0.1524" layer="91"/>
<wire x1="721.36" y1="748.665" x2="718.82" y2="748.665" width="0.1524" layer="91"/>
<wire x1="721.36" y1="746.125" x2="721.36" y2="748.665" width="0.1524" layer="91"/>
<wire x1="718.82" y1="746.125" x2="721.36" y2="746.125" width="0.1524" layer="91"/>
<wire x1="718.82" y1="746.125" x2="718.82" y2="738.505" width="0.1524" layer="91"/>
<wire x1="718.82" y1="738.505" x2="758.19" y2="738.505" width="0.1524" layer="91"/>
<wire x1="758.19" y1="738.505" x2="758.19" y2="654.05" width="0.1524" layer="91"/>
<junction x="758.19" y="654.05"/>
<pinref part="C7" gate="G$1" pin="P$2"/>
<wire x1="744.22" y1="630.555" x2="744.22" y2="626.745" width="0.1524" layer="91"/>
<junction x="744.22" y="626.745"/>
<wire x1="730.25" y1="573.405" x2="730.25" y2="540.385" width="0.1524" layer="91"/>
<junction x="730.25" y="573.405"/>
<pinref part="R31" gate="G$1" pin="1"/>
<pinref part="R37" gate="G$1" pin="2"/>
<wire x1="730.25" y1="540.385" x2="730.25" y2="539.75" width="0.1524" layer="91"/>
<wire x1="702.945" y1="540.385" x2="730.25" y2="540.385" width="0.1524" layer="91"/>
<junction x="730.25" y="540.385"/>
</segment>
</net>
<net name="N$17" class="0">
<segment>
<pinref part="U$10" gate="G$1" pin="G"/>
<wire x1="711.2" y1="793.115" x2="705.485" y2="793.115" width="0.1524" layer="91"/>
<pinref part="R21" gate="G$1" pin="2"/>
<pinref part="R25" gate="G$1" pin="2"/>
<wire x1="705.485" y1="793.115" x2="699.77" y2="793.115" width="0.1524" layer="91"/>
<wire x1="707.39" y1="788.67" x2="705.485" y2="788.67" width="0.1524" layer="91"/>
<wire x1="705.485" y1="788.67" x2="705.485" y2="793.115" width="0.1524" layer="91"/>
<junction x="705.485" y="793.115"/>
</segment>
</net>
<net name="N$18" class="0">
<segment>
<pinref part="U$10" gate="G$2" pin="G"/>
<wire x1="711.2" y1="772.795" x2="705.485" y2="772.795" width="0.1524" layer="91"/>
<pinref part="R22" gate="G$1" pin="2"/>
<wire x1="705.485" y1="772.795" x2="699.135" y2="772.795" width="0.1524" layer="91"/>
<pinref part="R26" gate="G$1" pin="1"/>
<wire x1="708.025" y1="768.35" x2="705.485" y2="768.35" width="0.1524" layer="91"/>
<wire x1="705.485" y1="768.35" x2="705.485" y2="772.795" width="0.1524" layer="91"/>
<junction x="705.485" y="772.795"/>
</segment>
</net>
<net name="N$19" class="0">
<segment>
<pinref part="R21" gate="G$1" pin="1"/>
<wire x1="652.145" y1="793.115" x2="689.61" y2="793.115" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="HO"/>
</segment>
</net>
<net name="C_LOW" class="0">
<segment>
<pinref part="BLUEPILL-STM32F103C8T6_MODULE" gate="G$1" pin="PB1"/>
<wire x1="459.105" y1="694.055" x2="431.165" y2="694.055" width="0.1524" layer="91"/>
<label x="440.69" y="694.055" size="1.27" layer="95"/>
<pinref part="J14" gate="G$1" pin="14"/>
</segment>
<segment>
<wire x1="579.12" y1="607.06" x2="562.61" y2="607.06" width="0.1524" layer="91"/>
<label x="564.515" y="607.695" size="1.778" layer="95"/>
<pinref part="J1" gate="1" pin="1"/>
</segment>
</net>
<net name="C_HIGH" class="0">
<segment>
<pinref part="BLUEPILL-STM32F103C8T6_MODULE" gate="G$1" pin="PB8"/>
<wire x1="502.285" y1="716.915" x2="509.905" y2="716.915" width="0.1524" layer="91"/>
<label x="511.175" y="716.915" size="1.27" layer="95"/>
<pinref part="J15" gate="G$1" pin="16"/>
<wire x1="509.905" y1="716.915" x2="524.51" y2="716.915" width="0.1524" layer="91"/>
<junction x="509.905" y="716.915"/>
</segment>
<segment>
<label x="559.435" y="617.855" size="1.778" layer="95"/>
<pinref part="IC1" gate="G$1" pin="HIN"/>
<wire x1="624.84" y1="617.22" x2="555.625" y2="617.22" width="0.1524" layer="91"/>
</segment>
</net>
<net name="HS_FL.SUP_A" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="VB"/>
<wire x1="652.145" y1="798.195" x2="670.56" y2="798.195" width="0.1524" layer="91"/>
<label x="652.145" y="798.83" size="1.4224" layer="95"/>
<pinref part="C15" gate="G$1" pin="P$1"/>
<wire x1="667.385" y1="788.035" x2="670.56" y2="788.035" width="0.1524" layer="91"/>
<wire x1="670.56" y1="788.035" x2="670.56" y2="798.195" width="0.1524" layer="91"/>
<wire x1="670.56" y1="798.195" x2="670.56" y2="799.465" width="0.1524" layer="91"/>
<junction x="670.56" y="798.195"/>
<pinref part="D3" gate="G$1" pin="C"/>
</segment>
</net>
<net name="PHASE_A" class="0">
<segment>
<pinref part="C15" gate="G$1" pin="P$2"/>
<pinref part="IC2" gate="G$1" pin="VS"/>
<wire x1="652.145" y1="788.035" x2="657.225" y2="788.035" width="0.1524" layer="91"/>
<wire x1="657.225" y1="788.035" x2="659.765" y2="788.035" width="0.1524" layer="91"/>
<junction x="657.225" y="788.035"/>
<wire x1="657.225" y1="788.035" x2="657.225" y2="783.59" width="0.1524" layer="91"/>
<label x="652.145" y="788.67" size="1.4224" layer="95"/>
<pinref part="U$10" gate="G$1" pin="S"/>
<wire x1="718.82" y1="790.575" x2="718.82" y2="788.67" width="0.1524" layer="91"/>
<wire x1="718.82" y1="788.67" x2="718.82" y2="783.59" width="0.1524" layer="91"/>
<pinref part="R25" gate="G$1" pin="1"/>
<wire x1="717.55" y1="788.67" x2="718.82" y2="788.67" width="0.1524" layer="91"/>
<junction x="718.82" y="788.67"/>
<wire x1="657.225" y1="783.59" x2="680.72" y2="783.59" width="0.1524" layer="91"/>
<junction x="718.82" y="783.59"/>
<pinref part="R23" gate="G$1" pin="1"/>
<wire x1="680.72" y1="783.59" x2="718.82" y2="783.59" width="0.1524" layer="91"/>
<wire x1="680.72" y1="770.255" x2="680.72" y2="783.59" width="0.1524" layer="91"/>
<junction x="680.72" y="783.59"/>
<wire x1="718.82" y1="783.59" x2="775.335" y2="783.59" width="0.1524" layer="91"/>
<pinref part="PHASE_C" gate="G$1" pin="1"/>
<label x="739.775" y="784.86" size="1.778" layer="95"/>
<pinref part="U$10" gate="G$2" pin="D@2"/>
<wire x1="721.36" y1="780.415" x2="721.36" y2="781.05" width="0.1524" layer="91"/>
<wire x1="721.36" y1="781.05" x2="718.82" y2="781.05" width="0.1524" layer="91"/>
<pinref part="U$10" gate="G$2" pin="D@1"/>
<wire x1="718.82" y1="781.05" x2="718.82" y2="780.415" width="0.1524" layer="91"/>
<wire x1="718.82" y1="781.05" x2="718.82" y2="783.59" width="0.1524" layer="91"/>
<junction x="718.82" y="781.05"/>
</segment>
</net>
<net name="BEMF_PHASE_C" class="0">
<segment>
<label x="440.69" y="709.295" size="1.27" layer="95"/>
<pinref part="BLUEPILL-STM32F103C8T6_MODULE" gate="G$1" pin="PA3/A5/RX2"/>
<wire x1="459.105" y1="709.295" x2="431.165" y2="709.295" width="0.1524" layer="91"/>
<pinref part="J14" gate="G$1" pin="8"/>
</segment>
<segment>
<pinref part="C8" gate="G$1" pin="P$2"/>
<wire x1="638.81" y1="588.01" x2="638.81" y2="585.47" width="0.1524" layer="91"/>
<wire x1="638.81" y1="588.01" x2="633.095" y2="588.01" width="0.1524" layer="91"/>
<label x="605.79" y="588.645" size="1.4224" layer="95"/>
<wire x1="633.095" y1="588.01" x2="596.9" y2="588.01" width="0.1524" layer="91"/>
<wire x1="650.875" y1="588.01" x2="638.81" y2="588.01" width="0.1524" layer="91"/>
<junction x="638.81" y="588.01"/>
<pinref part="R7" gate="G$1" pin="2"/>
<wire x1="633.095" y1="586.74" x2="633.095" y2="588.01" width="0.1524" layer="91"/>
<junction x="633.095" y="588.01"/>
<pinref part="R20" gate="G$1" pin="2"/>
</segment>
</net>
<net name="N$14" class="0">
<segment>
<wire x1="668.02" y1="525.145" x2="678.18" y2="525.145" width="0.1524" layer="91"/>
<pinref part="R32" gate="G$1" pin="2"/>
<wire x1="678.18" y1="525.145" x2="692.785" y2="525.145" width="0.1524" layer="91"/>
<pinref part="R33" gate="G$1" pin="1"/>
<wire x1="675.64" y1="516.255" x2="678.18" y2="516.255" width="0.1524" layer="91"/>
<wire x1="678.18" y1="516.255" x2="678.18" y2="525.145" width="0.1524" layer="91"/>
<junction x="678.18" y="525.145"/>
<pinref part="IC4" gate="G$1" pin="-IN"/>
</segment>
</net>
<net name="N$24" class="0">
<segment>
<pinref part="R33" gate="G$1" pin="2"/>
<wire x1="665.48" y1="516.255" x2="642.62" y2="516.255" width="0.1524" layer="91"/>
<wire x1="642.62" y1="516.255" x2="642.62" y2="527.685" width="0.1524" layer="91"/>
<wire x1="642.62" y1="527.685" x2="652.78" y2="527.685" width="0.1524" layer="91"/>
<pinref part="R34" gate="G$1" pin="1"/>
<wire x1="640.715" y1="527.685" x2="642.62" y2="527.685" width="0.1524" layer="91"/>
<junction x="642.62" y="527.685"/>
<pinref part="IC4" gate="G$1" pin="OUT"/>
</segment>
</net>
<net name="VCC3.3V" class="0">
<segment>
<wire x1="660.4" y1="535.305" x2="660.4" y2="540.385" width="0.1524" layer="91"/>
<wire x1="660.4" y1="540.385" x2="645.16" y2="540.385" width="0.1524" layer="91"/>
<label x="646.43" y="541.02" size="1.778" layer="95"/>
<pinref part="C18" gate="G$1" pin="P$2"/>
<wire x1="645.16" y1="540.385" x2="642.62" y2="540.385" width="0.1524" layer="91"/>
<wire x1="645.16" y1="539.115" x2="645.16" y2="540.385" width="0.1524" layer="91"/>
<junction x="645.16" y="540.385"/>
<pinref part="IC4" gate="G$1" pin="V+"/>
</segment>
<segment>
<pinref part="BLUEPILL-STM32F103C8T6_MODULE" gate="G$1" pin="3V3"/>
<wire x1="459.105" y1="683.895" x2="431.165" y2="683.895" width="0.1524" layer="91"/>
<label x="436.245" y="683.895" size="1.778" layer="95"/>
<pinref part="J14" gate="G$1" pin="18"/>
</segment>
</net>
<net name="SENSE_CURRENT_PA5" class="0">
<segment>
<label x="602.615" y="528.32" size="1.778" layer="95"/>
<pinref part="C19" gate="G$1" pin="P$2"/>
<wire x1="608.965" y1="527.685" x2="598.17" y2="527.685" width="0.1524" layer="91"/>
<wire x1="608.965" y1="524.51" x2="608.965" y2="527.685" width="0.1524" layer="91"/>
<junction x="608.965" y="527.685"/>
<pinref part="R34" gate="G$1" pin="2"/>
<wire x1="608.965" y1="527.685" x2="630.555" y2="527.685" width="0.1524" layer="91"/>
</segment>
<segment>
<label x="433.705" y="704.215" size="1.27" layer="95"/>
<pinref part="BLUEPILL-STM32F103C8T6_MODULE" gate="G$1" pin="PA5/A3/SCK1"/>
<wire x1="459.105" y1="704.215" x2="431.165" y2="704.215" width="0.1524" layer="91"/>
<pinref part="J14" gate="G$1" pin="10"/>
</segment>
</net>
<net name="N$25" class="0">
<segment>
<pinref part="BLUEPILL-STM32F103C8T6_MODULE" gate="G$1" pin="PA0/A8"/>
<wire x1="459.105" y1="716.915" x2="431.165" y2="716.915" width="0.1524" layer="91"/>
<pinref part="J14" gate="G$1" pin="5"/>
</segment>
</net>
<net name="N$30" class="0">
<segment>
<pinref part="BLUEPILL-STM32F103C8T6_MODULE" gate="G$1" pin="PA9/TX1"/>
<wire x1="502.285" y1="691.515" x2="509.905" y2="691.515" width="0.1524" layer="91"/>
<pinref part="JP1" gate="A" pin="2"/>
<wire x1="509.905" y1="691.515" x2="517.525" y2="691.515" width="0.1524" layer="91"/>
<wire x1="517.525" y1="691.515" x2="517.525" y2="695.96" width="0.1524" layer="91"/>
<wire x1="517.525" y1="695.96" x2="529.59" y2="695.96" width="0.1524" layer="91"/>
<pinref part="J15" gate="G$1" pin="6"/>
<junction x="509.905" y="691.515"/>
</segment>
</net>
<net name="N$31" class="0">
<segment>
<pinref part="BLUEPILL-STM32F103C8T6_MODULE" gate="G$1" pin="PA10/RX1"/>
<wire x1="502.285" y1="694.055" x2="509.905" y2="694.055" width="0.1524" layer="91"/>
<wire x1="509.905" y1="694.055" x2="514.985" y2="694.055" width="0.1524" layer="91"/>
<wire x1="514.985" y1="694.055" x2="514.985" y2="698.5" width="0.1524" layer="91"/>
<wire x1="514.985" y1="698.5" x2="529.59" y2="698.5" width="0.1524" layer="91"/>
<pinref part="JP1" gate="A" pin="1"/>
<pinref part="J15" gate="G$1" pin="7"/>
<junction x="509.905" y="694.055"/>
</segment>
</net>
<net name="SENSE_VIN" class="0">
<segment>
<wire x1="769.62" y1="835.66" x2="769.62" y2="836.295" width="0.1524" layer="91"/>
<label x="754.38" y="836.295" size="1.778" layer="95"/>
<pinref part="J9" gate="1" pin="2"/>
<pinref part="R36" gate="G$1" pin="1"/>
<wire x1="748.665" y1="835.66" x2="750.57" y2="835.66" width="0.1524" layer="91"/>
<wire x1="750.57" y1="835.66" x2="769.62" y2="835.66" width="0.1524" layer="91"/>
<junction x="750.57" y="835.66"/>
</segment>
<segment>
<label x="440.69" y="706.755" size="1.27" layer="95"/>
<pinref part="BLUEPILL-STM32F103C8T6_MODULE" gate="G$1" pin="PA4/A4/SS1"/>
<wire x1="459.105" y1="706.755" x2="431.165" y2="706.755" width="0.1524" layer="91"/>
<pinref part="J14" gate="G$1" pin="9"/>
</segment>
</net>
<net name="A_HIGH" class="0">
<segment>
<pinref part="BLUEPILL-STM32F103C8T6_MODULE" gate="G$1" pin="PB6/SCL1"/>
<wire x1="502.285" y1="711.835" x2="509.905" y2="711.835" width="0.1524" layer="91"/>
<wire x1="509.905" y1="711.835" x2="525.145" y2="711.835" width="0.1524" layer="91"/>
<wire x1="525.145" y1="711.835" x2="525.145" y2="713.105" width="0.1524" layer="91"/>
<label x="511.175" y="711.835" size="1.4224" layer="95"/>
<pinref part="J15" gate="G$1" pin="14"/>
<junction x="509.905" y="711.835"/>
</segment>
<segment>
<wire x1="626.745" y1="788.035" x2="564.515" y2="788.035" width="0.1524" layer="91"/>
<label x="572.77" y="788.035" size="1.778" layer="95"/>
<pinref part="IC2" gate="G$1" pin="HIN"/>
<label x="606.425" y="788.67" size="1.778" layer="95"/>
</segment>
</net>
<net name="+5VSB" class="0">
<segment>
<pinref part="D4" gate="G$1" pin="A"/>
<wire x1="596.9" y1="628.65" x2="596.9" y2="629.285" width="0.1524" layer="91"/>
<wire x1="596.9" y1="629.285" x2="554.355" y2="629.285" width="0.1524" layer="91"/>
<label x="581.025" y="629.92" size="1.778" layer="95"/>
<pinref part="BLUEPILL-STM32F103C8T6_MODULE" gate="G$1" pin="5V"/>
<wire x1="502.285" y1="721.995" x2="509.905" y2="721.995" width="0.1524" layer="91"/>
<label x="523.875" y="722.63" size="1.778" layer="95"/>
<pinref part="IC3" gate="G$1" pin="VO"/>
<wire x1="509.905" y1="721.995" x2="554.355" y2="721.995" width="0.1524" layer="91"/>
<wire x1="554.355" y1="721.995" x2="567.055" y2="721.995" width="0.1524" layer="91"/>
<wire x1="567.055" y1="721.995" x2="567.055" y2="740.41" width="0.1524" layer="91"/>
<wire x1="567.055" y1="740.41" x2="563.245" y2="740.41" width="0.1524" layer="91"/>
<pinref part="J15" gate="G$1" pin="18"/>
<junction x="509.905" y="721.995"/>
<wire x1="554.355" y1="629.285" x2="554.355" y2="721.995" width="0.1524" layer="91"/>
<junction x="554.355" y="721.995"/>
</segment>
</net>
<net name="N$32" class="0">
<segment>
<wire x1="668.02" y1="530.225" x2="678.18" y2="530.225" width="0.1524" layer="91"/>
<pinref part="R37" gate="G$1" pin="1"/>
<wire x1="678.18" y1="530.225" x2="678.18" y2="540.385" width="0.1524" layer="91"/>
<wire x1="678.18" y1="540.385" x2="687.07" y2="540.385" width="0.1524" layer="91"/>
<pinref part="IC4" gate="G$1" pin="+IN"/>
<pinref part="R29" gate="G$1" pin="1"/>
<wire x1="687.07" y1="540.385" x2="692.785" y2="540.385" width="0.1524" layer="91"/>
<wire x1="687.07" y1="539.75" x2="687.07" y2="540.385" width="0.1524" layer="91"/>
<junction x="687.07" y="540.385"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="R1" gate="G$1" pin="1"/>
<pinref part="IC1" gate="G$1" pin="HO"/>
<wire x1="691.515" y1="622.3" x2="650.24" y2="622.3" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<pinref part="J2" gate="1" pin="2"/>
<pinref part="R2" gate="G$1" pin="1"/>
<wire x1="675.005" y1="601.98" x2="691.515" y2="601.98" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<pinref part="J2" gate="1" pin="1"/>
<pinref part="IC1" gate="G$1" pin="LO"/>
<wire x1="664.845" y1="601.98" x2="650.24" y2="601.98" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="J3" gate="1" pin="2"/>
<pinref part="R9" gate="G$1" pin="1"/>
<wire x1="681.355" y1="695.325" x2="690.245" y2="695.325" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$10" class="0">
<segment>
<pinref part="J3" gate="1" pin="1"/>
<pinref part="IC5" gate="G$1" pin="HO"/>
<wire x1="671.195" y1="695.325" x2="649.605" y2="695.325" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$12" class="0">
<segment>
<pinref part="J4" gate="1" pin="2"/>
<pinref part="R10" gate="G$1" pin="1"/>
<wire x1="683.26" y1="675.005" x2="690.245" y2="675.005" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$13" class="0">
<segment>
<pinref part="J4" gate="1" pin="1"/>
<pinref part="IC5" gate="G$1" pin="LO"/>
<wire x1="673.1" y1="675.005" x2="649.605" y2="675.005" width="0.1524" layer="91"/>
</segment>
</net>
<net name="PHASE_BJ" class="0">
<segment>
<pinref part="R11" gate="G$1" pin="1"/>
<wire x1="678.18" y1="672.465" x2="678.18" y2="685.8" width="0.1524" layer="91"/>
<wire x1="654.685" y1="685.8" x2="678.18" y2="685.8" width="0.1524" layer="91"/>
<pinref part="C11" gate="G$1" pin="P$2"/>
<wire x1="654.685" y1="690.245" x2="657.225" y2="690.245" width="0.1524" layer="91"/>
<junction x="654.685" y="690.245"/>
<wire x1="654.685" y1="690.245" x2="654.685" y2="685.8" width="0.1524" layer="91"/>
<pinref part="IC5" gate="G$1" pin="VS"/>
<wire x1="649.605" y1="690.245" x2="654.685" y2="690.245" width="0.1524" layer="91"/>
<label x="649.605" y="690.88" size="1.4224" layer="95"/>
<pinref part="J5" gate="1" pin="1"/>
<wire x1="678.18" y1="685.8" x2="685.8" y2="685.8" width="0.1524" layer="91"/>
<junction x="678.18" y="685.8"/>
</segment>
</net>
<net name="N$20" class="0">
<segment>
<pinref part="R22" gate="G$1" pin="1"/>
<wire x1="688.975" y1="772.795" x2="685.8" y2="772.795" width="0.1524" layer="91"/>
<pinref part="R28" gate="G$1" pin="2"/>
</segment>
</net>
<net name="N$23" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="LO"/>
<wire x1="675.64" y1="772.795" x2="652.145" y2="772.795" width="0.1524" layer="91"/>
<pinref part="R28" gate="G$1" pin="1"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<pinref part="R3" gate="G$1" pin="2"/>
<wire x1="678.815" y1="588.01" x2="678.815" y2="589.28" width="0.1524" layer="91"/>
<wire x1="661.035" y1="588.01" x2="678.815" y2="588.01" width="0.1524" layer="91"/>
<pinref part="R20" gate="G$1" pin="1"/>
</segment>
</net>
<net name="B_LOW" class="0">
<segment>
<pinref part="BLUEPILL-STM32F103C8T6_MODULE" gate="G$1" pin="PB0/A0"/>
<wire x1="459.105" y1="696.595" x2="431.165" y2="696.595" width="0.1524" layer="91"/>
<label x="440.69" y="696.595" size="1.27" layer="95"/>
<pinref part="J14" gate="G$1" pin="13"/>
</segment>
<segment>
<pinref part="IC5" gate="G$1" pin="LIN"/>
<wire x1="624.205" y1="680.085" x2="561.975" y2="680.085" width="0.1524" layer="91"/>
<label x="567.055" y="680.72" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$27" class="0">
<segment>
<pinref part="R35" gate="G$1" pin="2"/>
<wire x1="736.6" y1="836.295" x2="736.6" y2="835.66" width="0.1524" layer="91"/>
<pinref part="J9" gate="1" pin="1"/>
<wire x1="736.6" y1="835.66" x2="738.505" y2="835.66" width="0.1524" layer="91"/>
</segment>
</net>
<net name="!SHDN_A_" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="!SD"/>
<wire x1="626.745" y1="782.955" x2="598.805" y2="782.955" width="0.1524" layer="91"/>
<label x="615.315" y="783.59" size="1.778" layer="95"/>
<wire x1="598.805" y1="782.955" x2="598.805" y2="772.795" width="0.1524" layer="91"/>
<pinref part="R24" gate="G$1" pin="2"/>
<wire x1="598.805" y1="772.795" x2="600.71" y2="772.795" width="0.1524" layer="91"/>
</segment>
</net>
<net name="B_HIGH_J0" class="0">
<segment>
<pinref part="IC5" gate="G$1" pin="HIN"/>
<wire x1="624.205" y1="690.245" x2="589.915" y2="690.245" width="0.1524" layer="91"/>
<label x="592.455" y="690.88" size="1.778" layer="95"/>
<pinref part="J11" gate="1" pin="2"/>
</segment>
</net>
<net name="N$34" class="0">
<segment>
<pinref part="BLUEPILL-STM32F103C8T6_MODULE" gate="G$1" pin="VBAT"/>
<pinref part="J14" gate="G$1" pin="1"/>
<wire x1="459.105" y1="727.075" x2="431.165" y2="727.075" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$35" class="0">
<segment>
<pinref part="BLUEPILL-STM32F103C8T6_MODULE" gate="G$1" pin="PC13"/>
<pinref part="J14" gate="G$1" pin="2"/>
<wire x1="459.105" y1="724.535" x2="431.165" y2="724.535" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$36" class="0">
<segment>
<pinref part="BLUEPILL-STM32F103C8T6_MODULE" gate="G$1" pin="PC14"/>
<pinref part="J14" gate="G$1" pin="3"/>
<wire x1="459.105" y1="721.995" x2="431.165" y2="721.995" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$37" class="0">
<segment>
<pinref part="BLUEPILL-STM32F103C8T6_MODULE" gate="G$1" pin="PC15"/>
<pinref part="J14" gate="G$1" pin="4"/>
<wire x1="459.105" y1="719.455" x2="431.165" y2="719.455" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$38" class="0">
<segment>
<pinref part="BLUEPILL-STM32F103C8T6_MODULE" gate="G$1" pin="PA6/A2/MISO1"/>
<pinref part="J14" gate="G$1" pin="11"/>
<wire x1="459.105" y1="701.675" x2="431.165" y2="701.675" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$39" class="0">
<segment>
<pinref part="BLUEPILL-STM32F103C8T6_MODULE" gate="G$1" pin="PB10/TX3/SCL2"/>
<pinref part="J14" gate="G$1" pin="15"/>
<wire x1="459.105" y1="691.515" x2="431.165" y2="691.515" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$40" class="0">
<segment>
<pinref part="BLUEPILL-STM32F103C8T6_MODULE" gate="G$1" pin="PB11/RX3/SDA2"/>
<pinref part="J14" gate="G$1" pin="16"/>
<wire x1="459.105" y1="688.975" x2="431.165" y2="688.975" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$41" class="0">
<segment>
<pinref part="BLUEPILL-STM32F103C8T6_MODULE" gate="G$1" pin="RESET"/>
<pinref part="J14" gate="G$1" pin="17"/>
<wire x1="459.105" y1="686.435" x2="431.165" y2="686.435" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$43" class="0">
<segment>
<pinref part="BLUEPILL-STM32F103C8T6_MODULE" gate="G$1" pin="PB12/SS2"/>
<pinref part="J15" gate="G$1" pin="1"/>
<wire x1="502.285" y1="678.815" x2="509.905" y2="678.815" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$44" class="0">
<segment>
<pinref part="BLUEPILL-STM32F103C8T6_MODULE" gate="G$1" pin="PB13/SCK2"/>
<pinref part="J15" gate="G$1" pin="2"/>
<wire x1="502.285" y1="681.355" x2="509.905" y2="681.355" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$45" class="0">
<segment>
<pinref part="BLUEPILL-STM32F103C8T6_MODULE" gate="G$1" pin="PB14/MIS02"/>
<pinref part="J15" gate="G$1" pin="3"/>
<wire x1="502.285" y1="683.895" x2="509.905" y2="683.895" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$46" class="0">
<segment>
<pinref part="BLUEPILL-STM32F103C8T6_MODULE" gate="G$1" pin="PB15/MOSI2"/>
<pinref part="J15" gate="G$1" pin="4"/>
<wire x1="502.285" y1="686.435" x2="509.905" y2="686.435" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$47" class="0">
<segment>
<pinref part="BLUEPILL-STM32F103C8T6_MODULE" gate="G$1" pin="PA8"/>
<pinref part="J15" gate="G$1" pin="5"/>
<wire x1="502.285" y1="688.975" x2="509.905" y2="688.975" width="0.1524" layer="91"/>
<wire x1="509.905" y1="688.975" x2="516.89" y2="688.975" width="0.1524" layer="91"/>
<wire x1="516.89" y1="688.975" x2="516.89" y2="687.07" width="0.1524" layer="91"/>
<junction x="509.905" y="688.975"/>
<wire x1="516.89" y1="687.07" x2="527.05" y2="687.07" width="0.1524" layer="91"/>
<wire x1="527.05" y1="687.07" x2="527.05" y2="690.88" width="0.1524" layer="91"/>
<pinref part="JP1" gate="A" pin="4"/>
<wire x1="527.05" y1="690.88" x2="529.59" y2="690.88" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$48" class="0">
<segment>
<pinref part="BLUEPILL-STM32F103C8T6_MODULE" gate="G$1" pin="PA11/USB-"/>
<pinref part="J15" gate="G$1" pin="8"/>
<wire x1="502.285" y1="696.595" x2="509.905" y2="696.595" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$49" class="0">
<segment>
<pinref part="BLUEPILL-STM32F103C8T6_MODULE" gate="G$1" pin="PA12/USB+"/>
<pinref part="J15" gate="G$1" pin="9"/>
<wire x1="502.285" y1="699.135" x2="509.905" y2="699.135" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$50" class="0">
<segment>
<pinref part="BLUEPILL-STM32F103C8T6_MODULE" gate="G$1" pin="PA15"/>
<pinref part="J15" gate="G$1" pin="10"/>
<wire x1="502.285" y1="701.675" x2="509.905" y2="701.675" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$51" class="0">
<segment>
<pinref part="BLUEPILL-STM32F103C8T6_MODULE" gate="G$1" pin="PB3"/>
<pinref part="J15" gate="G$1" pin="11"/>
<wire x1="502.285" y1="704.215" x2="509.905" y2="704.215" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$52" class="0">
<segment>
<pinref part="BLUEPILL-STM32F103C8T6_MODULE" gate="G$1" pin="PB4"/>
<pinref part="J15" gate="G$1" pin="12"/>
<wire x1="502.285" y1="706.755" x2="509.905" y2="706.755" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$53" class="0">
<segment>
<pinref part="BLUEPILL-STM32F103C8T6_MODULE" gate="G$1" pin="PB5"/>
<pinref part="J15" gate="G$1" pin="13"/>
<wire x1="502.285" y1="709.295" x2="509.905" y2="709.295" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$54" class="0">
<segment>
<pinref part="BLUEPILL-STM32F103C8T6_MODULE" gate="G$1" pin="PB9"/>
<pinref part="J15" gate="G$1" pin="17"/>
<wire x1="502.285" y1="719.455" x2="509.905" y2="719.455" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$55" class="0">
<segment>
<pinref part="BLUEPILL-STM32F103C8T6_MODULE" gate="G$1" pin="3V3/1"/>
<pinref part="J15" gate="G$1" pin="20"/>
<wire x1="502.285" y1="727.075" x2="509.905" y2="727.075" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="R8" gate="G$1" pin="2"/>
<pinref part="R23" gate="G$1" pin="2"/>
<wire x1="679.45" y1="758.825" x2="680.72" y2="758.825" width="0.1524" layer="91"/>
<wire x1="680.72" y1="758.825" x2="680.72" y2="760.095" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$26" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="LIN"/>
<wire x1="626.745" y1="777.875" x2="598.17" y2="777.875" width="0.1524" layer="91"/>
<pinref part="R16" gate="G$1" pin="1"/>
</segment>
</net>
<net name="C_LOW_J1" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="LIN"/>
<wire x1="624.84" y1="607.06" x2="589.28" y2="607.06" width="0.1524" layer="91"/>
<label x="600.71" y="607.695" size="1.778" layer="95"/>
<pinref part="J1" gate="1" pin="2"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
<compatibility>
<note version="6.3" minversion="6.2.2" severity="warning">
Since Version 6.2.2 text objects can contain more than one line,
which will not be processed correctly with this version.
</note>
</compatibility>
</eagle>
