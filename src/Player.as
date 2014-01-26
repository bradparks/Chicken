package
{
	import flash.display.Sprite;
	import flash.geom.Point;
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.FlxBar;
	import org.flixel.plugin.photonstorm.FlxMath;

	public class Player extends FlxSprite
	{
		internal var chooseindex:int;
		
		// GUI STUFF
		public const GUI_OFFSET_X : Number = 0.04;
		public const GUI_OFFSET_Y : Number = 0.04;
		public const GUI_SCALE_X : Number = 0.90;
		public const GUI_SCALE_Y : Number = 0.90;
		
		
		// CHARA CONTROL STUFF
		public var defaultkeys:Boolean;
		public var charStats : SpriteHolder;
		public var walkSound : FlxSound = null;
		
		public var enemy:Player;
		public var insultpower:Number = 100.0;
		public var insultincrement:Number = 0.8;
		public var lastKnownGrndPose : FlxPoint;
		
		public var bar:FlxBar;
		public var gaugeSprite:FlxSprite;
		public var status:FlxText;
		public var insult:FlxText;
		public var curNbJump:int = 0;
		
		public var iconChicken:FlxSprite;
		public var iconElephant:FlxSprite;
		public var iconTurtle:FlxSprite;
		public var iconPig:FlxSprite;
		
		public var activeIcon : FlxSprite = null;
		
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
			
			charStats = Assets.animaldict["turtle"];
			drag.x = charStats.DRAG_SPEED;  // Drag is how quickly you slow down when you're not pushing a button. By using a multiplier, it will always scale to the run speed, even if we change it.
            acceleration.y = charStats.GRAVITY; // Always try to push helmutguy in the direction of charStats.GRAVITY
			drag.y = charStats.GRAVITY;
            maxVelocity.x = charStats.RUN_SPEED;
            maxVelocity.y = charStats.JUMP_SPEED;
			
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
			
			// SETUP PLAYER GUI
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
				
				
				// setup right animal icons
				iconChicken = new FlxSprite(0, 0, Assets.ICON_CHICKEN);
				iconChicken.x = FlxG.camera.width-iconChicken.width;
				
				iconElephant = new FlxSprite(0, 0, Assets.ICON_ELEPHANT);
				iconElephant.x = FlxG.camera.width-iconElephant.width;
				
				iconTurtle = new FlxSprite(0, 0, Assets.ICON_TURTLE);
				iconTurtle.x = FlxG.camera.width-iconTurtle.width;
				
				iconPig = new FlxSprite(0, 0, Assets.ICON_PIG);
				iconPig.x = FlxG.camera.width-iconPig.width;
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
				
				
				// setup left animal icons
				iconChicken = new FlxSprite(0, 0, Assets.ICON_CHICKEN);
				iconElephant = new FlxSprite(0, 0, Assets.ICON_ELEPHANT);
				iconTurtle = new FlxSprite(0, 0, Assets.ICON_TURTLE);
				iconPig = new FlxSprite(0, 0, Assets.ICON_PIG);
			}
			
			iconChicken.scrollFactor.x = 0;
			iconChicken.scrollFactor.y = 0;
			iconChicken.y = 40;
			
			iconPig.scrollFactor.x = 0;
			iconPig.scrollFactor.y = 0;
			iconPig.y = 40;
			
			iconElephant.scrollFactor.x = 0;
			iconElephant.scrollFactor.y = 0;
			iconElephant.y = 40;
			
			iconTurtle.scrollFactor.x = 0;
			iconTurtle.scrollFactor.y = 0;
			iconTurtle.y = 40;
			
			lvl.add(iconPig);
			lvl.add(iconChicken);
			lvl.add(iconTurtle);
			lvl.add(iconElephant);
			
			iconPig.visible = false;
			iconChicken.visible = false;
			iconTurtle.visible = false;
			iconElephant.visible = false;
			
			//======================================================================
			
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
			
			if (activeIcon != null)
			{
				activeIcon.update();
				activeIcon.visible = true;
			}
			
			FlxG.collide(emitter, lvl.map);
			
			insult.x = x + width/2 - insult._textField.textWidth/2;
			insult.y = y - insult.frameHeight - 10;
			
			emitter.x = x + width / 2;
			emitter.y = y + height / 2;
			
			acceleration.x = 0;
			drag.y = charStats.GRAVITY;
			
			if (defaultkeys)
			{
				if(FlxG.keys.justPressed("U"))
				{
					chooseindex = (chooseindex + 1) % (Assets.animals.length);
					SetActiveSprite(Assets.animals[chooseindex]);
				}
				if(FlxG.keys.J)
				{
					facing = LEFT;
					acceleration.x -= charStats.DRAG_SPEED;
				}
				else if(FlxG.keys.L)
				{
					facing = RIGHT;
					acceleration.x += charStats.DRAG_SPEED;
				}
				if(FlxG.keys.justPressed("I"))
				{
					morphEnemy();
				}
				if(FlxG.keys.justPressed("SPACE") && CanJump())
				{
					Jump();
				}
			}
			
			else
			{
				if(FlxG.keys.justPressed("E"))
				{
					chooseindex = (chooseindex + 1) % (Assets.animals.length);
					SetActiveSprite(Assets.animals[chooseindex]);
				}
				if(FlxG.keys.A)
				{
					facing = LEFT;
					acceleration.x -= charStats.DRAG_SPEED;
				}
				else if(FlxG.keys.D)
				{
					facing = RIGHT;
					acceleration.x += charStats.DRAG_SPEED;
				}
				if(FlxG.keys.justPressed("W"))
				{
					morphEnemy();
				}
				if(FlxG.keys.justPressed("SPACE") && CanJump())
				{
					Jump();
				}
			}
			
			insultpower += insultincrement;
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
				if (!velocity.y)
				{
					play("Walk");
					if ( walkSound == null )
						walkSound = FlxG.play(charStats.STEP_SOUND, Assets.SFX_LEVEL, true, false);
					else 
						walkSound.play(true);
				}
				
				if (!velocity.x)
				{
					if ( walkSound != null )
						walkSound.stop();
				}
			}
			
			if ( isTouching(FLOOR) )
			{
				lastKnownGrndPose = new FlxPoint(x, y);
			}
		}
		
		public function morphEnemy():void
		{
			//Huge insult
			if (insultpower > 98.0 && activeIcon != null && Assets.animals[chooseindex] != enemy.currentanimal)
			{
				var ani:String = Assets.animals[chooseindex];
				enemy.status.text = "You are a " + ani;
				//var tempy:int = y;
				var tempheight:int = enemy.height;
				//trace(ani, ins);
				enemy.currentanimal = ani;
				charStats = Assets.animaldict[ani] as SpriteHolder;
				enemy.loadGraphic(charStats.anim, true, true, charStats.fwidth, charStats.fheight, true);
				enemy.width = charStats.fwidth;
				enemy.height = charStats.fheight;
				MoveToFloor(enemy);
				
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
						enemy.addAnimation("Walk", [0, 1, 2], charStats.walkfps, true);
						enemy.addAnimation("Jump", [6, 7, 8], 2, false);
						break;
				}
				
				//enemy.y -= enemy.height - tempheight;
				enemy.velocity.y -= 100;
				
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
				//enemy.charStats.JUMP_SPEED = FlxMath.randFloat(0.5, 2) * INIT_charStats.JUMP_SPEED;
				//enemy.charStats.GRAVITY = FlxMath.randFloat(0.5, 2) * INIT_charStats.GRAVITY;
				//enemy.charStats.RUN_SPEED = FlxMath.randFloat(0.5, 2) * INIT_SPEED;
				//enemy.charStats.DRAG_SPEED = FlxMath.randFloat(0.5, 2) * INIT_charStats.DRAG_SPEED;
				
				FlxG.play(charStats.SPAWN_SOUND, Assets.SFX_LEVEL);
			}
			
			//Casual insults
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
		
		private function CanJump():Boolean
		{
			var grounded : Boolean = isTouching(FlxObject.FLOOR);
			if (grounded) curNbJump = 0;
			
			//FlxG.shake(0.01);
			//FlxG.flash(0xffffffff);
			//insultpower = 0.0;
			//enemy.JUMP_SPEED = FlxMath.randFloat(0.5, 2) * INIT_JUMP_SPEED;
			//enemy.GRAVITY = FlxMath.randFloat(0.5, 2) * INIT_GRAVITY;
			//enemy.RUN_SPEED = FlxMath.randFloat(0.5, 2) * INIT_SPEED;
			//enemy.DRAG_SPEED = FlxMath.randFloat(0.5, 2) * INIT_DRAG_SPEED;
			return grounded || (curNbJump < charStats.MAX_JUMPS && velocity.y > 0);
		}
		
		private function Jump():void 
		{
			curNbJump++;
			velocity.y = -charStats.JUMP_SPEED;
			play("Jump");
			FlxG.play(charStats.JUMP_SOUND, Assets.SFX_LEVEL);
		}
		
		private function MoveToFloor(p:Player):void
		{
			var tileMap : FlxTilemap = lvl.map;
			
			var res:FlxPoint = new FlxPoint(0, 0);
			if ( ! tileMap.ray( new FlxPoint(p.x, p.y), new FlxPoint(p.x, p.y + 500), res) )
			{
				p.y = res.y - p.height*1.30;
			}
			else trace ("FUUUUUUUUUUU-");
		}
		
		private function SetActiveSprite( name : String ) : void 
		{
			var toActivate : FlxSprite = null;
			
			switch ( name )
			{
				case "turtle":
					toActivate = iconTurtle;
					break;
				case "pig":
					toActivate = iconPig;
					break;
				case "elephant":
					toActivate = iconElephant;
					break;
				case "chicken":
					toActivate = iconChicken;
					break;
			}
			
			if ( activeIcon != null )
			{
				activeIcon.visible = false;
			}
			activeIcon = toActivate;
		}
	}
}