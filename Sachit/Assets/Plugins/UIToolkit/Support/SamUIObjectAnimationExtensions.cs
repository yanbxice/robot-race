using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using SamUIEaseType = System.Func<float, float>; 


public static class SamUIObjectAnimationExtensions
{
	#region Specific Animation methods
	
	// alpha
	public static SamUIAnimation alphaTo( this SamUIObject sprite, float duration, float target, SamUIEaseType ease )
	{
		return to( sprite, duration, SamUIAnimationProperty.Alpha, target, ease );
	}


	public static SamUIAnimation alphaFrom( this SamUIObject sprite, float duration, float target, SamUIEaseType ease )
	{
		return from( sprite, duration, SamUIAnimationProperty.Alpha, target, ease );
	}


	public static SamUIAnimation alphaFromTo( this SamUIObject sprite, float duration, float start, float target, SamUIEaseType ease )
	{
		return fromTo( sprite, duration, SamUIAnimationProperty.Alpha, start, target, ease );
	}


	// color
	public static SamUIAnimation colorTo( this SamUIObject sprite, float duration, Color target, SamUIEaseType ease )
	{
		return to( sprite, duration, SamUIAnimationProperty.Color, target, ease );
	}


	public static SamUIAnimation colorFrom( this SamUIObject sprite, float duration, Color target, SamUIEaseType ease )
	{
		return from( sprite, duration, SamUIAnimationProperty.Color, target, ease );
	}


	public static SamUIAnimation colorFromTo( this SamUIObject sprite, float duration, Color start, Color target, SamUIEaseType ease )
	{
		return fromTo( sprite, duration, SamUIAnimationProperty.Color, start, target, ease );
	}

	
	// euler angles
	public static SamUIAnimation eulerAnglesTo( this SamUIObject sprite, float duration, Vector3 target, SamUIEaseType ease )
	{
		return to( sprite, duration, SamUIAnimationProperty.EulerAngles, target, ease );
	}
	

	public static SamUIAnimation eulerAnglesFrom( this SamUIObject sprite, float duration, Vector3 target, SamUIEaseType ease )
	{
		return from( sprite, duration, SamUIAnimationProperty.EulerAngles, target, ease );
	}
	
	
	public static SamUIAnimation eulerAnglesFromTo( this SamUIObject sprite, float duration, Vector3 start, Vector3 target, SamUIEaseType ease )
	{
		return fromTo( sprite, duration, SamUIAnimationProperty.EulerAngles, start, target, ease );
	}


	// local scale
	public static SamUIAnimation scaleTo( this SamUIObject sprite, float duration, Vector3 target, SamUIEaseType ease )
	{
		return to( sprite, duration, SamUIAnimationProperty.LocalScale, target, ease );
	}
	

	public static SamUIAnimation scaleFrom( this SamUIObject sprite, float duration, Vector3 target, SamUIEaseType ease )
	{
		return from( sprite, duration, SamUIAnimationProperty.LocalScale, target, ease );
	}
	
	
	public static SamUIAnimation scaleFromTo( this SamUIObject sprite, float duration, Vector3 start, Vector3 target, SamUIEaseType ease )
	{
		return fromTo( sprite, duration, SamUIAnimationProperty.LocalScale, start, target, ease );
	}


	// localPosition
	public static SamUIAnimation positionTo( this SamUIObject sprite, float duration, Vector3 target, SamUIEaseType ease )
	{
		return to( sprite, duration, SamUIAnimationProperty.Position, target, ease );
	}
	

	public static SamUIAnimation positionFrom( this SamUIObject sprite, float duration, Vector3 target, SamUIEaseType ease )
	{
		return from( sprite, duration, SamUIAnimationProperty.Position, target, ease );
	}
	
	
	public static SamUIAnimation positionFromTo( this SamUIObject sprite, float duration, Vector3 start, Vector3 target, SamUIEaseType ease )
	{
		return fromTo( sprite, duration, SamUIAnimationProperty.Position, start, target, ease );
	}

	
	#endregion
	
	
	#region Generic Animation methods
	
	// float version (for alpha)
	public static SamUIAnimation to( this SamUIObject sprite, float duration, SamUIAnimationProperty aniProperty, float target, SamUIEaseType ease )
	{
		return animate( sprite, true, duration, aniProperty, target, ease );
	}


	// Color version
	public static SamUIAnimation to( this SamUIObject sprite, float duration, SamUIAnimationProperty aniProperty, Color target, SamUIEaseType ease )
	{
		return animate( sprite, true, duration, aniProperty, target, ease );
	}
	
	
	// Vector3 version
	public static SamUIAnimation to( this SamUIObject sprite, float duration, SamUIAnimationProperty aniProperty, Vector3 target, SamUIEaseType ease )
	{
		return animate( sprite, true, duration, aniProperty, target, ease );
	}

	
	// float version (for alpha)
	public static SamUIAnimation from( this SamUIObject sprite, float duration, SamUIAnimationProperty aniProperty, float target, SamUIEaseType ease )
	{
		return animate( sprite, false, duration, aniProperty, target, ease );
	}


	// Color version
	public static SamUIAnimation from( this SamUIObject sprite, float duration, SamUIAnimationProperty aniProperty, Color target, SamUIEaseType ease )
	{
		return animate( sprite, false, duration, aniProperty, target, ease );
	}
	

	// Vector3 version
	public static SamUIAnimation from( this SamUIObject sprite, float duration, SamUIAnimationProperty aniProperty, Vector3 target, SamUIEaseType ease )
	{
		return animate( sprite, false, duration, aniProperty, target, ease );
	}


	// float version (for alpha)
	public static SamUIAnimation fromTo( this SamUIObject sprite, float duration, SamUIAnimationProperty aniProperty, float start, float target, SamUIEaseType ease )
	{
		return animate( sprite, duration, aniProperty, start, target, ease );
	}


	// Color version
	public static SamUIAnimation fromTo( this SamUIObject sprite, float duration, SamUIAnimationProperty aniProperty, Color start, Color target, SamUIEaseType ease )
	{
		return animate( sprite, duration, aniProperty, start, target, ease );
	}
	
	
	// Vector3 version
	public static SamUIAnimation fromTo( this SamUIObject sprite, float duration, SamUIAnimationProperty aniProperty, Vector3 start, Vector3 target, SamUIEaseType ease )
	{
		return animate( sprite, duration, aniProperty, start, target, ease );
	}

	
	// Figures out the start value and kicks off the animation - float version
	private static SamUIAnimation animate( SamUIObject sprite, bool animateTo, float duration, SamUIAnimationProperty aniProperty, float target, SamUIEaseType ease )
	{
		float current = 0.0f;
		
		// Grab the current value
		switch( aniProperty )
		{
			case SamUIAnimationProperty.Alpha:
				current = sprite.color.a;
				break;
		}

		float start = ( animateTo ) ? current : target;

		// If we are doing a 'from', the target is our current position
		if( !animateTo )
			target = current;
		
		return animate( sprite, duration, aniProperty, start, target, ease );
	}
	

	// Sets up and starts a new animation in a Coroutine - float version
	private static SamUIAnimation animate( SamUIObject sprite, float duration, SamUIAnimationProperty aniProperty, float start, float target, SamUIEaseType ease )
	{
		SamUIAnimation ani = new SamUIAnimation( sprite, duration, aniProperty, start, target, ease );
		SamUI.instance.StartCoroutine( ani.animate() );
		
		return ani;
	}


	// Figures out the start value and kicks off the animation - Color version
	private static SamUIAnimation animate( SamUIObject sprite, bool animateTo, float duration, SamUIAnimationProperty aniProperty, Color target, SamUIEaseType ease )
	{
		// Grab the current value
		Color current = sprite.color;
		Color start = ( animateTo ) ? current : target;

		// If we are doing a 'from', the target is our current position
		if( !animateTo )
			target = current;
		
		return animate( sprite, duration, aniProperty, start, target, ease );
	}
	

	// Sets up and starts a new animation in a Coroutine - Color version
	private static SamUIAnimation animate( SamUIObject sprite, float duration, SamUIAnimationProperty aniProperty, Color start, Color target, SamUIEaseType ease )
	{
		SamUIAnimation ani = new SamUIAnimation( sprite, duration, aniProperty, start, target, ease );
		SamUI.instance.StartCoroutine( ani.animate() );
		
		return ani;
	}
	

	// Figures out the start value and kicks off the animation - Vector3 version
	private static SamUIAnimation animate( SamUIObject sprite, bool animateTo, float duration, SamUIAnimationProperty aniProperty, Vector3 target, SamUIEaseType ease )
	{
		Vector3 current = Vector3.zero;
		
		// Grab the current value
		switch( aniProperty )
		{
			case SamUIAnimationProperty.Position:
				current = sprite.localPosition;
				break;
			case SamUIAnimationProperty.LocalScale:
				current = sprite.localScale;
				break;
			case SamUIAnimationProperty.EulerAngles:
				current = sprite.eulerAngles;
				break;
		}
		
		Vector3 start = ( animateTo ) ? current : target;
		
		// If we are doing a 'from', the target is our current position
		if( !animateTo )
			target = current;
		
		return animate( sprite, duration, aniProperty, start, target, ease );
	}


	// Sets up and starts a new animation in a Coroutine - Vector3 version
	private static SamUIAnimation animate( SamUIObject sprite, float duration, SamUIAnimationProperty aniProperty, Vector3 start, Vector3 target, SamUIEaseType ease )
	{
		var ani = new SamUIAnimation( sprite, duration, aniProperty, start, target, ease );
		SamUI.instance.StartCoroutine( ani.animate() );
		
		return ani;
	}
	
	#endregion

}
