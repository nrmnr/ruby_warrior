# RUBY WARRIOR INTERMEDIATE LEVEL 7
class Player
  def play_turn(warrior)
    # add your code here
    dirs = [:forward, :left, :right, :backward]
    ticking_sp = warrior.listen.find{|sp| sp.ticking?}
    enemy_dirs = dirs.select{|dir| warrior.feel(dir).enemy?}

    if ticking_sp # 爆弾を付けられた捕虜が残っている
      ticking_dir = warrior.direction_of ticking_sp
      case
      when enemy_dirs.size > 1
        warrior.bind! enemy_dirs.last # :forward方向は配列の最初
      when enemy_dirs.size == 1
        warrior.attack! enemy_dirs.first
      when t_dir = dirs.find{|dir| warrior.feel(dir).ticking?}
        warrior.rescue! t_dir
      else
        warrior.walk! ticking_dir
      end
    else # 残りは捕虜か敵
      target_sp = warrior.listen.select{|sp| sp.captive? or sp.enemy?}
      case
      when dir = dirs.find{|dir| warrior.feel(dir).enemy?}
        warrior.attack! dir
      when warrior.health < 15
        warrior.rest!
      when dir = dirs.find{|dir| warrior.feel(dir).captive?}
        warrior.rescue! dir
      when !target_sp.empty?
        warrior.walk!(warrior.direction_of target_sp.first)
      else
        warrior.walk! warrior.direction_of_stairs
      end
    end
  end
end
