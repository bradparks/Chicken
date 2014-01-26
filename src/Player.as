package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.FlxBar;
	import org.flixel.plugin.photonstorm.FlxMath;

	public class Player extends FlxSprite
	{
		// GUI STUFF
		public const GUI_OFFSET_X = 0.04;
		public const GUI_OFFSET_Y = 0.04;
		public const GUI_SCALE_X = 0.90;
		public const GUI_SCALE_Y = 0.90;
		
		
		// CHARA CONTROL STUFF
		public var RUN_SPEED:int = 400;
		public var GRAVITY:int = 420;
		public var JUMP_SPEED:int = 420;
		public var DRAG_SPEED:int = 200;
		public var MAX_SPEED:int = 400;
		public var MAX_JUMP:int = 1;
		
		public var defaultkeys:Boolean;
		
		public var enemy:Player;
		public var insultpower:Number = 100.0;
		public var insultincrement:Number = 0.8;
		
		public var bar:FlxBar;
		public var gaugeSprite:FlxSprite
		public var status:FlxText;
		public var insult:FlxText;
		public var curNbJump:int = 0;
		
		public var lvl:PlayState;
		
		public var emitter:FlxEmitter;
		
		public var currentanimal:String = "turtle";
		
		public function Player(_x:int, _y:int, color:uint = 0xffffffff, defaultKeyset:Boolean = true):void
		{                
			super(_x, _y);
			lvl = Registry.lvl;
			
			defaultkeys = defaultKeyset;
			
			loadGraphic(Assets.TURTLE, true, true, 68, 32);
			//loadGraphic(Assets.HUMAN, true, true, 38, 100, true);
			
			//loadGraphic(Assets.PIG, true, true, 64, 44);
			
			addAnimation("Idle", [3, 4, 5], 2, true);
			addAnimation("Walk", [0, 1, 2], 6, true);
			addAnimation("Jump", [6, 7, 8], 2, false);
			
			//addAnimation("Idle", [5, 6], 2, true);
			//addAnimation("Walk", [0, 1, 2, 3, 4], 6, true);
			//addAnimation("Jump", [0, 1, 2, 3], 2, false);
			
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
				gaugeSprite = new FlxSprite(0, 0, Assets.GAUGE);
				gaugeSprite.x = FlxG.width * GUI_OFFSET_X;
				gaugeSprite.y = FlxG.height * GUI_OFFSET_Y;
				gaugeSprite.scrollFactor.x = 0;
				gaugeSprite.scrollFactor.y = 0;
				
				bar = new FlxBar(gaugeSprite.x, gaugeSprite.y, FlxBar.FILL_LEFT_TO_RIGHT, gaugeSprite.width, gaugeSprite.height, this, "insultpower");
				bar.createFilledBar(0xFFAAAAAA, 0xFFFFAAAA);
				status = new FlxText(gaugeSprite.x, gaugeSprite.y + gaugeSprite.height, 200, "You are a turtle");
				status.alignment = "center";
			}
			
			else
			{
				
				status = new FlxText(FlxG.width - 200, 30, 200, "You are a turtle");
				gaugeSprite = new FlxSprite(0, 0, Assets.GAUGE);
				gaugeSprite.x = FlxG.width - gaugeSprite.width - FlxG.width * GUI_OFFSET_X;
				gaugeSprite.y = FlxG.height * GUI_OFFSET_Y;
				gaugeSprite.scrollFactor.x = 0;
				gaugeSprite.scrollFactor.y = 0;
				
				
				bar = new FlxBar(gaugeSprite.x, gaugeSprite.y, FlxBar.FILL_LEFT_TO_RIGHT, gaugeSprite.width, gaugeSprite.height, this, "insultpower");
				bar.createFilledBar(0xFFAAAAAA, 0xFFFFAAAA);
				status = new FlxText(gaugeSprite.x, gaugeSprite.y + gaugeSprite.height, 200, "You are a turtle");
				status.alignment = "center";
			}
			
			status.size = 12;
			status.scrollFactor.x = status.scrollFactor.y = 0;
			status.shadow = 0xffffffff;
			status.color = 0xff000000;
			lvl.add(status);
			
			bar.scrollFactor.x = bar.scrollFactor.y = 0;
			lvl.add(bar);
			lvl.add(gaugeSprite);
			
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
				if(FlxG.keys.J)
				{
					facing = LEFT;
					acceleration.x -= DRAG_SPEED;
				}
				else if(FlxG.keys.L)
				{
					facing = RIGHT;
					insultpower += insultincrement;
					acceleration.x += DRAG_SPEED;
				}
				if(FlxG.keys.justPressed("I"))
				{
					morphEnemy();
					//velocity.y = -JUMP_SPEED;
					//FlxG.play(SndJump);
				}
				if(FlxG.keys.justPressed("SPACE") && CanJump())
				{
					Jump();
					//velocity.y = -JUMP_SPEED;
					//play("Jump");
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
				if(FlxG.keys.justPressed("SPACE") && CanJump())
				{
					Jump();
					//velocity.y = -JUMP_SPEED;
					//play("Jump");
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
					//var tempy:int = y;
					var tempheight:int = enemy.height;
					//trace(ani, ins);
					enemy.currentanimal = ani;
					var sprite:SpriteHolder = Assets.animaldict[ani] as SpriteHolder;
					enemy.loadGraphic(sprite.anim, true, true, sprite.fwidth, sprite.fheight, true);
					enemy.width = sprite.fwidth;
					enemy.height = sprite.fheight;
					
					//enemy.y -= enemy.height - tempheight;
					
					switch(ani)
					{
						case "human":
							enemy.addAnimation("Idle", [5, 6], 2, true);
							enemy.addAnimation("Walk", [0, 1, 2, 3, 4, ], 6, true);
							enemy.addAnimation("Jump", [0, 1, 2, 3, 4, ], 2, false);
							break;
						
						case "elephant":
							enemy.addAnimation("Idle", [3, 4], 2, true);
							enemy.addAnimation("Walk", [0, 1, 2], 6, true);
							enemy.addAnimation("Jump", [6, 7], 2, false);
							break;
							
						default:
							enemy.addAnimation("Idle", [3, 4, 5], 2, true);
							enemy.addAnimation("Walk", [0, 1, 2], sprite.walkfps, true);
							enemy.addAnimation("Jump", [6, 7, 8], 2, false);
							break;
					}
					
					enemy.JUMP_SPEED = sprite.JUMP_SPEED;
					enemy.GRAVITY = sprite.GRAVITY;
					enemy.RUN_SPEED = sprite.RUN_SPEED;
					enemy.DRAG_SPEED = sprite.DRAG_SPEED;
					enemy.MAX_JUMP = sprite.MAX_JUMPS;
					
					//enemy.y -= enemy.height - tempheight;
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
			if (currentanimal == enemy.currentanimal)
			{
				var ins:String = Assets.CASUAL_INSULTS[FlxMath.rand(0, Assets.CASUAL_INSULTS.length - 1)];
				insult.text = ins;
				insult.color = 0xff000000;
			}
			
			else
			{
				var arr:Array;
				
				switch(enemy.currentanimal)
				{
					case "pig":
						arr = Assets.INSULTS_OF_PIG;
						break;
					case "chicken":
						arr = Assets.INSULTS_OF_CHICKEN;
						break;
					case "elephant":
						arr = Assets.INSULTS_OF_ELEPHANT;
						break;
					case "human":
						arr = Assets.INSULTS_OF_HUMAN;
						break;
					case "turtle":
						arr = Assets.INSULTS_OF_TURTLE;
						break;
				}
				
				var ins:String = arr[FlxMath.rand(0, arr.length - 1)];
				insult.text = ins;
				insult.color = 0xff000000;
			}
		}
	}
	
	private function CanJump():Boolean
	{
		var grounded : Boolean = isTouching(FlxObject.FLOOR);
		if (grounded) curNbJump = 0;
		
		return grounded || curNbJump < MAX_JUMP;
	}
	
	private function Jump():void 
	{
		curNbJump++;
		velocity.y = -JUMP_SPEED;
		play("Jump");
	}
}
}