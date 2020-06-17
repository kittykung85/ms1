//	Circle partition layout for Howmooc 2.0  --2016.3.30
d3.json("js/lecture.json", function (error, root) {
var 
//    width = window.screen.availWidth * 1,
//    height = window.screen.availHeight * 0.55,
//	padding = 10,

    width = 900,
    height = 900,
	padding = 100,
    radius = Math.min(width, height) / 2 - padding;

var max_depth = maxDepth(root);	//depth start form 0
	show_level = 2; 	//顯示層數
var end_depth = show_level - 1; 	//有顯示的最後一層的depth
var endRadius = show_level / (max_depth + 1); 	//顯示的最外層的outRadius @ y domain
var scale = (max_depth + 1) / show_level; 	//放大倍率
var hideDepth = show_level; 		//hide from depth
var middleRadius = radius / (show_level + 1); //中心的圓半徑
var fontsize = 30;
var fontsize2 = 30; //文字大小
var imgwidth = 150, imgheight = 150;
var midImgWidth = 150, midImgHeight = 150; 	//only for case i=0

var currentCenter; 	//current center的d
var zoomin = 1; 	//	zoomin:0=>zoomout

var x = d3.scale.linear()
    .range([0, 2 * Math.PI]);

var y = d3.scale.linear()
	.range([0, radius * scale]);

var color = d3.scale.category20c();

var svg = d3.select("body").select("div.partition").append("svg")
    .attr("width", width)
    .attr("height", height)
	.append("g")
    .attr("transform", "translate(" + width / 2 + "," + (height / 2) + ")");

var partition = d3.layout.partition()
	.sort(null)
    .value(function (d) { return d.size; });

var arc = d3.svg.arc()
    .startAngle(function (d) { return Math.max(0, Math.min(2 * Math.PI, x(d.x))); })
    .endAngle(function (d) { return Math.max(0, Math.min(2 * Math.PI, x(d.x + d.dx))); })
    .innerRadius(function (d) { return Math.max(0, y(d.y)); })
    .outerRadius(function (d) { return Math.max(0, y(d.y + d.dy)); });

var tooltip = d3.select("body")
			  .append("div")
			  .attr("class", "tooltip")
			  .style("opacity", 0.0);

var intro = tooltip.append("div")
				 .attr("class", "intro");

var capita = tooltip.append("img")
					.attr("class", "capita")
			        .attr("src", "");
//mouseover圖片顯示


    currentCenter = root;

    var grads = svg.append("defs").selectAll("radialGradient").data(partition.nodes(root))
    .enter().append("radialGradient")
    .attr("gradientUnits", "userSpaceOnUse")
    .attr("cx", 0)
    .attr("cy", 0)
    .attr("r", "170%")
    .attr("id", function (d, i) { return "grad" + d.color; });
    grads.append("stop").attr("offset", "10%").style("stop-color", function (d, i) { return d.color; });
    grads.append("stop").attr("offset", "15%").style("stop-color", "white");
    grads.append("stop").attr("offset", "22%").style("stop-color", function (d, i) { return d.color; });

    var g = svg.selectAll("g")
			.data(partition.nodes(root))
			.enter().append("g")
			.style("opacity", function (d) {
			    d.visible = 0; //tooltip先預設所有情況下不會顯示
			    return d.depth < hideDepth ? 1 : 0;
			});





    var path = g.append("path")
			.attr("d", arc)
			.style("fill", function (d, i) { return "url(#grad" + d.color + ")"; })
			.on("click", click)
			.on("mouseover", function (d, i) {
			    d3.select(this).style("opacity", "0.9");
			    if (d.title != null && d.visible) {

			        tooltip.style("left", (d3.event.pageX) + "px")
					.style("top", (d3.event.pageY + 20) + "px")
					.style("opacity", 1.0);
			        intro.html(d.title + "<br/>" + d.teacher + "<br/>")
					     .style("float", "right")  //mouseover文字敘述位置
						 .style("width", "200px");
			        if (d.capita != null) {
			            capita.attr("src", d.capita)
					      .style("float", "left") //mouseover頭像位置
						  .style("width", "100px")
						  .style("height", "100px");
			        }
			        else {
			            capita.attr("src", "")
					      .style("float", "right")
						  .style("width", "100px")
						  .style("height", "100px");
			        }

			    }

			})
			.on("mousemove", function (d) {
			    tooltip.style("middle", (d3.event.pageX) + "px")
					   .style("top", (d3.event.pageY + 20) + "px");
			})
			.on("mouseout", function (d) {
			    d3.select(this).style("opacity", "1");
			    tooltip.style("opacity", 0.0);
			});
    /*
    var img = g.append("svg:image")
    .attr("width",function(d,i){	return i==0 ? midImgWidth : imgwidth;		})
    .attr("height",function(d,i){	return i==0 ? midImgHeight : imgheight;	})
    .attr("xlink:href",function(d){	return d.img;	})
    .attr("transform", function(d,i){	return setImage(d,i);	});
    */

    var a = g.append("a")
			.attr("xlink:href", function (d) { return d.url; })
	        .attr("target", "_blank");


    var text = a.append("text")
			.style("font-size", function (d) {
			    if (d.children == null) return fontsize + "px";
			    else return fontsize2 + "px";
			})
			.style("font-weight", "bold")
			.style("font-family", "cursive")
            .attr("class", function (d) {
                return d.url ? "course" : "";
            })
            .attr("fill", function (d) {
                return d.url ? "red" : "";
            })
			.attr("text-anchor", function (d, i) { return setTextAnchor(d, i); })
			.attr("dx", function (d, i) { return setTextMargin(d, i); })
			.attr("dy", ".35em") // vertical-align
			.attr("transform", function (d, i) { return setText(d, i); })
			.text(function (d) { return d.name; });
    //			.on("mouseover", function (d) {
    //			    if (d.url != null) {
    //			        d3.select(this).attr("fill", "blue")
    //								   .attr("text-decoration", "underline");
    //			    }
    //			})
    //			.on("mouseout", function (d) {
    //			    d3.select(this).attr("fill", "black")
    //							   .attr("text-decoration", "none");
    //			});

    console.log(d3.selectAll(".course"));
    d3.selectAll(".course")
            .on("mouseover", function (d) {
                d3.select(this).attr("fill", "blue")
								.attr("text-decoration", "underline");

            })
			.on("mouseout", function (d) {
			    d3.select(this).attr("fill", "red")
							   .attr("text-decoration", "none");
			});

    var centerImg = svg.append("svg:image")
				.attr("width", 2 * middleRadius)
				.attr("height", 2 * middleRadius)
				.attr("xlink:href", root.img)
				.attr("transform", "translate(" + (-middleRadius) + "," + (-middleRadius) + ")");

    //	Home
    d3.select("#home").on("click", function () {
        centerImg.attr("xlink:href", "");
        path.call(click(root));
    });
    //	zoom out
    d3.select("#zoomout").on("click", function () {
        zoomin = 0;
        centerImg.attr("xlink:href", "");
        path.call(click(currentCenter));
    });

    function click(d) {
        if (d.depth) { currentCenter = d.parent; }
        //
        /*
        if(d.depth > 0){
        d3.selectAll("image")
        .transition()
        .attr("width",function(){	return 2*middleRadius;	})
        .attr("height",function(){	return 2*middleRadius;	})
        .attr("transform","translate("+(-middleRadius)+","+(-middleRadius)+")");
        img.attr("opacity", 0);
        }
        */

        var speed = 0;
        if (d.depth == 1 && zoomin) { speed = 500; }
        else speed = 0;

        centerImg
        //.attr("xlink:href",getForwardImg(d,1))
			.attr("xlink:href", d.img)
			.style("opacity", 0)
			.transition()
			.duration(speed)
			.style("opacity", 1);

        // fade out all text elements
        text.transition()
			.attr("opacity", 1)
			.each("end", function () {
			    text.attr("transform", "translate(0,0)");
			})
			.text("");  //0425文字重疊bug修復

        //隱藏超過的層數
        hideDepth = d.depth + show_level;
        g.transition()
			.style("opacity", function (e, i) {
			    if (e.depth < hideDepth) {
			        e.visible = 1;
			    } else e.visible = 0;
			    return e.depth < hideDepth ? 1 : 0;
			});


        path.transition()
			.duration(500)
			.attrTween("d", arcTween(d))
			.each("end", function (e, i) {
			    // check if the animated element's data e lies within the visible angle span given in d
			    if (e.x >= d.x && e.x < (d.x + d.dx)) {
			        // get a selection of the associated text element
			        var arcText = d3.select(this.parentNode).select("text");
			        // fade in the text element and recalculate positions
			        arcText.transition().duration(500)
						.attr("opacity", 1)
						.attr("transform", function () {
						    return (e == d) ? "translate(" + arc.centroid(d) + ")rotate(0)" : setText(e, i);
						})
						.attr("text-anchor", function () {
						    return (e == d) ? "middle" : setTextAnchor(e, i);
						})
						.attr("dx", function () {
						    return (e == d) ? 0 : setTextMargin(e, i);
						})
						.text(function () { return e.name; });  //0425重疊文字bug修復
			    }
			    //中心圖片回到各校區塊
			    /*
			    if(d.depth == 0){
			    img.transition().duration(500)
			    .attr("opacity",1)
			    .attr("width",function(){	return	imgwidth;	})
			    .attr("height",function(){	return	imgheight;	})
			    .attr("transform",function(e,i){	return setImage(e,i);	});
			    }
			    */
			});
    }


    d3.select(self.frameElement).style("height", height + "px");

    // Interpolate the scales!
    function arcTween(d) {
        endRadius = (d.depth + (show_level - 1) + 1) / (max_depth + 1);
        endRadius = endRadius > 1 ? 1 : endRadius;

        var xd = d3.interpolate(x.domain(), [d.x, d.x + d.dx]),
		    yd = d3.interpolate(y.domain(), [d.y, endRadius]),
		    yr = d3.interpolate(y.range(), [d.y ? middleRadius : 0, radius]);
        return function (d, i) {
            return i
			    ? function (t) { return arc(d); }
			    : function (t) {
			        x.domain(xd(t));
			        y.domain(yd(t)).range(yr(t));
			        return arc(d);
			    };
        };
    }

    function setTextAnchor(d, i) {
        if (i == 0)
            return "Middle";
        else
            return (x(d.x + d.dx / 2) / Math.PI * 180 < 180) ? "start" : "end";
    }
    function setTextMargin(d, i) {
        if (i == 0)
            return "0";
        else
            return (x(d.x + d.dx / 2) / Math.PI * 180 < 180) ? "6" : "-6";
    }
    function setText(d, i) {
        //第一個元素（最中間的），只平移不旋轉
        if (i == 0) { return "translate(0,0)"; }
        //其他的元素，既平移也旋轉
        var angle = 0;
        if (x(d.x + d.dx / 2) / Math.PI * 180 < 180)  // 0 - 180 度以內的
            angle = (x(d.x + d.dx / 2) - Math.PI / 2) / Math.PI * 180;
        else  // 180 - 360 度以內的
            angle = (x(d.x + d.dx / 2) + Math.PI / 2) / Math.PI * 180;

        //平移到(tx,ty)
        var tx = 0;
        var ty = 0;
        if (x(d.x + d.dx / 2) / Math.PI * 180 < 180) {
            tx = y(d.y) * Math.cos(angle * Math.PI / 180);
            ty = y(d.y) * Math.sin(angle * Math.PI / 180);
        } //右半圓
        else {
            tx = -y(d.y) * Math.cos(angle * Math.PI / 180);
            ty = -y(d.y) * Math.sin(angle * Math.PI / 180);
        } //左半圓

        return "translate(" + tx + "," + ty + ")" + "rotate(" + angle + ")";
    }
    function setImage(d, i) {

        //中心圖片置中
        if (i == 0) { return "translate(" + (0 - 0.5 * midImgWidth) + "," + (0 - 0.5 * midImgHeight) + ")"; }

        var offset = 0.02; //圖片的向外偏移量	@ y domain
        var angle = 0;
        if (x(d.x + d.dx / 2) / Math.PI * 180 < 180)  // 0 - 180 度以內的
            angle = (x(d.x + d.dx / 2) - Math.PI / 2) / Math.PI * 180;
        else  // 180 - 360 度以內的
            angle = (x(d.x + d.dx / 2) + Math.PI / 2) / Math.PI * 180;

        //平移到(imgx,imgy)
        var imgx = 0;
        var imgy = 0;
        if (x(d.x + d.dx / 2) / Math.PI * 180 < 180) {
            imgx = y(d.y + d.dy + offset) * Math.cos(angle * Math.PI / 180);
            imgy = y(d.y + d.dy + offset) * Math.sin(angle * Math.PI / 180);

        } //右半圓
        else {
            imgx = -y(d.y + d.dy + offset) * Math.cos(angle * Math.PI / 180);
            imgy = -y(d.y + d.dy + offset) * Math.sin(angle * Math.PI / 180);
        } //左半圓
        return "translate(" + (imgx - 0.5 * imgwidth) + "," + (imgy - 0.5 * imgheight) + ")";
    }

    function getForwardImg(d, targetDepth) {
        var tmp = d;
        while (tmp.depth > targetDepth) {
            tmp = tmp.parent;
        }
        return d.depth ? tmp.img : "";
    }
    //Get tree Height , start from 0
    function maxDepth(data) {
        if (!data.children) {
            return 0;
        } else {
            var tmp = 0;
            for (var i = 0; i < data.children.length; i++) {
                tmp = Math.max(tmp, maxDepth(data.children[i]));
            }
            return tmp + 1;
        }
    }

});