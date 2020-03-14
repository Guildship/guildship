defmodule Guildship.EntitiesTest do
  use Guildship.DataCase
  use Guildship
  alias Guilds.{Guild, ForumThreadReply, NewsPost}
  alias Entities.{Entity, Report}

  describe "entities" do
    test "it should be able to get all reports" do
      [r1, r2, r3, r4] = insert_list(4, :entity_report)
      content_1 = insert(:guild_news_post, entity: r1.entity)
      content_2 = insert(:guild, entity: r2.entity)
      content_3 = insert(:guild_news_post, entity: r3.entity)
      content_4 = insert(:guild_forum_thread_reply, entity: r4.entity)

      assert [
               %Report{entity: %Entity{guild_news_post: %NewsPost{} = guild_news_post_1}},
               %Report{entity: %Entity{guild: %Guild{} = guild}},
               %Report{entity: %Entity{guild_news_post: %NewsPost{} = guild_news_post_2}},
               %Report{
                 entity: %Entity{
                   guild_forum_thread_reply: %ForumThreadReply{} = guild_forum_thread_reply
                 }
               }
             ] = Entities.list_reports()

      assert guild_news_post_1.id == content_1.id
      assert guild.id == content_2.id
      assert guild_news_post_2.id == content_3.id
      assert guild_forum_thread_reply.id == content_4.id
    end
  end
end
