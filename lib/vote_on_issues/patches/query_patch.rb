
module VoteOnIssues
  module Patches
    module QueryPatch
      
      def sum_votes_up(issue)
        if User.current.allowed_to?(:view_votes, nil, :global => true)
          VoteOnIssue.where('vote_value > 0 AND issue_id=?', issue.id).sum('vote_value')
        else
          '-'
        end
      end

      def sum_votes_dn(issue)
        if User.current.allowed_to?(:view_votes, nil, :global => true)
          VoteOnIssue.where('vote_value < 0 AND issue_id=?', issue.id).sum('vote_value')
        else
          '-'
        end
      end

      def my_vote(issue)
        if User.current.allowed_to?(:view_votes, nil, :global => true)
          v = VoteOnIssue.where('issue_id=? AND user_id=?', issue.id, User.current.id).first
          if v.nil?
            '-'
          elsif v.vote_value > 0
            'Up'
          else
            'Down'
          end
        else
          '-'
        end
      end
    end
  end
end
