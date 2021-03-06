package dragonfly.addons.filters.lib 
{
	import dragonfly.addons.filters.lib.eggs.BlurEgg;

	import flash.filters.BlurFilter;

	
	
	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class BlurLarva extends BaseFilterLarva 
	{
		/* ----- VARIABLES -------------------------------------------------- */
		private var _filter : BlurFilter;
		/* ----- FILTER PROPERTIES (non tweenable) -------------------------- */
		private var _quality : int;

		
		
		/* ----- INITIALIZING ----------------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		public function BlurLarva(
			target : *,
			use_frames : Boolean,
			fps : Number
		)
		{
			super( target, use_frames, fps );
			_filter = new BlurFilter( 0, 0, 4 );
		}

		/* ----- FILTER GETTER ---------------------------------------------- */

		/**
		 * TODO: write documentation
		 */
		public function get filter() : BlurFilter
		{
			return _filter;
		}

		/* ----- CONFIGURATION VALUES --------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		public function conf( quality : int ) : BlurLarva 
		{
			_filter.quality = ( _quality = quality );
			return this;
		}

		/* ----- X, Y ------------------------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		public function x(
			end : Number,
			start : Number = undefined
		) : BlurLarva
		{
			_lay( BlurEgg, BlurEgg.X, end, start );
			return this;
		}

		/**
		 * TODO: write documentation
		 */
		public function y(
			end : Number,
			start : Number = undefined
		) : BlurLarva
		{
			_lay( BlurEgg, BlurEgg.Y, end, start );
			return this;
		}		

		/**
		 * TODO: write documentation
		 */
		public function xy(
			end_x : Number,
			end_y : Number,
			start_x : Number = undefined,
			start_y : Number = undefined
		) : BlurLarva
		{
			x( end_x, start_x );
			x( end_y, start_y );
			return this;
		}
	}
}