module Hookers
  module Git
    class Repository
      def last_commit
        revision = %x(git log -1 HEAD --format=%H%n%an%n%s).split("\n")
        Git::Commit.new(revision[0], revision[1], revision[2])
      end
    end
  end
 end