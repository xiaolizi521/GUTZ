package com.sparklemountain.gutz.designer.model.vo {
	
	//] includes [!]>
	//]=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~.
	import flash.display.MovieClip;
	import flash.geom.Point;
	//]~=~=~=~=~=~=~=~=~=~=~=~=~=~[]~=~=~=~=~=~=~=~=~=~=~=~=~=~[
	
	/**
	 * 
	 * @author:		Gullinbursti
	 * @class:		HandWheelVO
	 * @package:	com.sparklemountain.gutz.designer.model.vo
	 * @created:	3:12:55 PM Nov 25, 2011
	 */
	
	// <[!] class delaration [¡]>
	public class HandWheelVO {
	//~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~~*~._
		
		//] class properties ]>
		//]=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~.
		public var ind:int;
		public var asset_mc:MovieClip;
		public var pos_pt:Point;
		public var speed:Number;
		// <[=-=-=-=-=-=-=-=-=-=-=-=][=-=-=-=-=-=-=-=-=-=-=-=]>
		
		
		// <*] class constructor [*>
		public function HandWheelVO(idx:int, asset:MovieClip, pos:Point, spd:Number) {
		//~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~~*~._
			
			this.ind = idx;
			this.asset_mc = asset;
			this.pos_pt = pos.clone();
			this.speed = spd;
		}//]~*~~*~~*~~*~~*~~*~~*~~*~~·¯
		
		//]~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=[>
		//]~=~=~=~=~=~=~=~=~=[>
		
		
		
		public function toString():String {
		//~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~~*~._	
			
			var ret_str:String = "\n"+this+":\n[=-=-=-=-=-=-=-=-=-=-=-=-=-=]";
				ret_str += "\n[ind]: "+this.ind;
				ret_str += "\n[asset_mc]: "+this.asset_mc;
				ret_str += "\n[pos_pt]: "+this.pos_pt;
				ret_str += "\n[speed]: "+this.speed;
				ret_str += "\n[=-=-=-=-=-=-=-=-=-=-=-=-=-=]";
				ret_str += "\n[=-=-=-=-=-=-=-=-=-=-=-=-=-=]";
			
			return (ret_str + "\n");
		}//]~*~~*~~*~~*~~*~~*~~*~~*~~·¯
	}
}