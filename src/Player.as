package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.FlxBar;
	import org.flixel.plugin.photonstorm.FlxMath;

	public class Player extends FlxSprite
	{
		public static const INIT_SPEED:int = 400;
		public static const INIT_GRAVITY:int =420;
		public static const INIT_JUMP_SPEED:int = 420;
		public static const INIT_DRAG_SPEED:int = 200;
		public static const INIT_MAX_SPEED:int = 200;
		
		public var RUN_SPEED:int = 400;
		public var GRAVITY:int = 420;
		public var JUMP_SPEED:int = 420;
		public var DRAG_SPEED:int = 200;
		public var MAX_SPEED:int = 400;
		
		public var defaultkeys:Boolean;
		
		public var enemy:Player;
		public var insultpower:Number = 100.0;
		public var insultincrement:Number = 0.8;
		
		public var bar:FlxBar;
		public var status:FlxText;
		public var insult:FlxText;
		
		public var lvl:PlayState;
		
		public var emitter:FlxEmitter;
		
		public var currentanimal:String = "turtle";
		
		public function Player(_x:int, _y:int, color:uint = 0xffffffff, defaultKeyset:Boolean = true):void
		{                
			super(_x, _y);
			lvl = Registry.lvl;
			
			defaultkeys = defaultKeyset;
			
			//loadGraphic(ImgSpaceman,true,true,8);
			//loadGraphic(
			loadGraphic(Assets.TURTLE, true, true, 68, 32);
			//loadGraphic(Assets.PIG, true, true, 64, 44);
			addAnimation("Idle", [3, 4, 5], 2, true);
			addAnimation("Walk", [0, 1, 2], 6, true);
			addAnimation("Jump", [6, 7, 8], 2, false);
			
			drag.x = DRAG_SPEED;  // Drag is how quickly you slow down when you're not pushing a button. By using a multiplier, it will always scale to the run speed, even if we change it.
            acceleration.y = GRAVITY; // Always try to push helmutguy in the direction of gravity
			drag.y = GRAVITY;
            maxVelocity.x = RUN_SPEED;
            maxVelocity.y = JUMP_SPEED;
			
			//makeGraphic(50, 50, color);
			
			//addAnimation("idle", [0]);
			//addAnimation("run", [1, 2, 3, 0], 12);
			//addAnimation("jump", [4]);
			//addAnimation("idle_up", [5]);
			//addAnimation("run_up", [6, 7, 8, 5], 12);
			//addAnimation("jump_up", [9]);
			//addAnimation("jump_down", [10]);
			
			insult = new FlxText(_x, _y, 200, "I don't like you!");
			insult.shadow = 0xffffffff;
			insult.color = 0xff000000;
			insult.size = 11;
			lvl.add(insult);
			
			if (defaultkeys)
			{
				bar = new FlxBar(0, 0, FlxBar.FILL_LEFT_TO_RIGHT, 200, 20, this, "insultpower");
				
				status = new FlxText(0, 30, 200, "You are a chicken");
			}
			
			else
			{
				bar = new FlxBar(FlxG.width - 200, 0, FlxBar.FILL_LEFT_TO_RIGHT, 200, 20, this, "insultpower");
				
				status = new FlxText(FlxG.width - 200, 30, 200, "You are a turtle");
			}
			
			status.size = 12;
			status.scrollFactor.x = status.scrollFactor.y = 0;
			status.shadow = 0xffffffff;
			status.color = 0xff000000;
			lvl.add(status);
			
			bar.scrollFactor.x = bar.scrollFactor.y = 0;
			lvl.add(bar);
			
			emitter = new FlxEmitter(_x, _y, 30);
			lvl.add(emitter);
			
			play("Idle");
		}
		
		override public function destroy():void
		{
			super.destroy();
		}
		
		override public function update():void
		{
			super.update();
			
			FlxG.collide(emitter, lvl.map);
			
			insult.x = x + width/2 - insult._textField.textWidth/2;
			insult.y = y - insult.frameHeight - 10;
			
			emitter.x = x + width / 2;
			emitter.y = y + height / 2;
			
			acceleration.x = 0;
			drag.y = GRAVITY;
			
			if (defaultkeys)
			{
				if(FlxG.keys.LEFT)
				{
					facing = LEFT;
					acceleration.x -= DRAG_SPEED;
				}
				else if(FlxG.keys.RIGHT)
				{
					facing = RIGHT;
					insultpower += insultincrement;
					acceleration.x += DRAG_SPEED;
				}
				if(FlxG.keys.justPressed("UP"))
				{
					morphEnemy();
					//velocity.y = -JUMP_SPEED;
					//FlxG.play(SndJump);
				}
				if(FlxG.keys.justPressed("SPACE") && !velocity.y)
				{
					velocity.y = -JUMP_SPEED;
					play("Jump");
					//FlxG.play(SndJump);
				}
			}
			
			else
			{
				if(FlxG.keys.A)
				{
					facing = LEFT;
					acceleration.x -= DRAG_SPEED;
				}
				else if(FlxG.keys.D)
				{
					facing = RIGHT;
					acceleration.x += DRAG_SPEED;
					insultpower += insultincrement;
				}
				if(FlxG.keys.justPressed("W"))
				{
					morphEnemy();
					//velocity.y = -JUMP_SPEED;
					//FlxG.play(SndJump);
				}
				if(FlxG.keys.justPressed("SPACE") && !velocity.y)
				{
					play("Jump");
					velocity.y = -JUMP_SPEED;
					//FlxG.play(SndJump);
				}
			}
			//ANIMATION
			//if(velocity.y != 0)
			//{
				//if(_aim == UP) play("jump_up");
				//else if(_aim == DOWN) play("jump_down");
				//else play("jump");
			//}
			if (velocity.x == 0 && !velocity.y)
			{
				play("Idle");
			}
			
			else
			{
				if (!velocity.y) play("Walk");
			}
			//else
			//{
				//if(_aim == UP) play("run_up");
				//else play("run");
			//}
		//}
	}
	
	public function morphEnemy():void
	{
		//Huge insult
		if (insultpower > 98.0)
		{
			var found:Boolean = false;
			
			while (!found)
			{
				var ins:String = Assets.INSULTS_OF_DEATH[FlxMath.rand(0, Assets.INSULTS_OF_DEATH.length - 1)];
				if (ins.search(enemy.currentanimal) == -1) found = true;
			}
			
			insult.text = ins;
			insult.color = 0xffff0000;
			
			for each (var ani:String in Assets.animals)
			{
				//trace(ani, ins);
				if (ins.search(ani) != -1)
				{
					enemy.status.text = "You are a " + ani;
					//trace(ani, ins);
					enemy.currentanimal = ani;
					var sprite:SpriteHolder = Assets.animaldict[ani] as SpriteHolder;
					enemy.loadGraphic(sprite.anim, true, true, sprite.fwidth, sprite.fheight);
					enemy.width = sprite.fwidth;
					enemy.height = sprite.fheight;
					
					enemy.addAnimation("Idle", [3, 4, 5], 2, true);
					enemy.addAnimation("Walk", [0, 1, 2], 6, true);
					enemy.addAnimation("Jump", [6, 7, 8], 2, false);
					
					enemy.JUMP_SPEED = sprite.JUMP_SPEED;
					enemy.GRAVITY = sprite.GRAVITY;
					enemy.RUN_SPEED = sprite.RUN_SPEED;
					enemy.DRAG_SPEED = sprite.DRAG_SPEED;
					
					enemy.velocity.y -= 100;
				}
			}
			
			for(var i:int = 0; i < 30; i++)
			{
				var particle:FlxParticle = new FlxParticle();
				particle.makeGraphic(3, 3, 0xffFF1C1C);
				particle.exists = false;
				//particle.lifespan = 1.6;
				enemy.emitter.add(particle);
			}
			 
			enemy.emitter.start(true, 1.6);
			
			FlxG.shake(0.01);
			FlxG.flash(0xffffffff);
			insultpower = 0.0;
			//enemy.JUMP_SPEED = FlxMath.randFloat(0.5, 2) * INIT_JUMP_SPEED;
			//enemy.GRAVITY = FlxMath.randFloat(0.5, 2) * INIT_GRAVITY;
			//enemy.RUN_SPEED = FlxMath.randFloat(0.5, 2) * INIT_SPEED;
			//enemy.DRAG_SPEED = FlxMath.randFloat(0.5, 2) * INIT_DRAG_SPEED;
		}
		
		//Casual insults
		else
		{
			var ins:String = Assets.CASUAL_INSULTS[FlxMath.rand(0, Assets.CASUAL_INSULTS.length - 1)];
			insult.text = ins;
			insult.color = 0xff000000;
		}
	}
}
}