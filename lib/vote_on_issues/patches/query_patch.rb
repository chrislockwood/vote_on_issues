
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
      
    end
  end
end
