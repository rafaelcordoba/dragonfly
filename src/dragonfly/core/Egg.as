package dragonfly.core 
{
	import cocktail.core.gunz.Gun;
	import cocktail.core.gunz.Gunz;

	import dragonfly.core.gunz.NymphBullet;

	
	
	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class Egg
	{
		internal var _nymph : Nymph;
		public var gunz : Gunz;
		public var gunz_on_start : Gun;
		public var gunz_on_progress : Gun;
		public var gunz_on_complete : Gun;
		protected var _prop : String;
		protected var _larva : Larva;
		protected var _end : Number;
		protected var _start : Number;
		public var _active : Boolean;

		
		
		public function Egg(
			prop : String,
			larva : Larva,
			end : Number,
			start : Number = undefined
		) 
		{
			_nymph = new Nymph( );
			_nymph.gunz_on_start.add( _tween_start );
			_nymph.gunz_on_progress.add( _tween_progress );
			_nymph.gunz_on_complete.add( _tween_complete );
			
			gunz = new Gunz( this );
			gunz_on_start = new Gun( gunz, this, "start" );
			gunz_on_progress = new Gun( gunz, this, "progress" );
			gunz_on_complete = new Gun( gunz, this, "complete" );
			
			_prop = prop;
			_larva = larva;
			_end = end;
			_start = start || _larva.default_target[ _prop ];
		}

		internal function _shoke(
			duration : Number,
			delay : Number,
			equation : Function,
			fps : Number,
			use_frames : Boolean,
			equation_args : *
		) : Egg
		{
			_nymph.config( _start, _end, duration, delay, equation, equation_args, fps, use_frames );
			
			return this;
		}

		private function _tween_start( bullet : NymphBullet ) : void 
		{
			_active = true;
			
			if( hasOwnProperty( "start" ) )
				this[ "start" ]( bullet );
			
			gunz_on_start.shoot( bullet );
		}

		private function _tween_progress( bullet : NymphBullet ) : void 
		{
			if( hasOwnProperty( "progress" ) )
				this[ "progress" ]( bullet );
			
			gunz_on_progress.shoot( bullet );
		}

		private function _tween_complete( bullet : NymphBullet ) : void 
		{
			_active = false;
			
			if( hasOwnProperty( "complete" ) )
				this[ "complete" ]( bullet );
			
			gunz_on_complete.shoot( bullet );
		}

		public function hold() : Egg 
		{
			_nymph.hold( );
			return this;
		}

		public function unhold() : Egg 
		{
			_nymph.unhold( );
			return this;
		}

		public function fries() : Egg 
		{
			_nymph.destroy( );
			return this;
		}

		public function get targets() : Array
		{
			return _larva.targets;
		}

		public function get time_left() : Number 
		{
			return _nymph.time_left;
		}

		public function get active() : Boolean 
		{
			return _active;
		}
	}
}